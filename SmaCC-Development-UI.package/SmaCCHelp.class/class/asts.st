pages
asts
	^ HelpTopic
		title: 'ASTs'
		contents:
'SmaCC Abstract Syntax Trees

SmaCC can generate abstract syntax trees from an annotated grammar. In addition to the node classes to represent the trees, SmaCC also generates a generic visitor for the tree classes.

To create an AST, you need to annotate your grammar. Let''s start with the grammar of our simple expression parser from the tutorial. Since we are wanting to build an AST, I''ve removed the code that evaluates the expression.

<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";

Expression 
	: Expression "+" Expression 
	| Expression "-" Expression
	| Expression "*" Expression
	| Expression "/" Expression
	| Expression "^" Expression
	| "(" Expression ")"
	| Number
	;
Number 
	: <number>
	;

Building an AST parser works similarly to the normal parser. Instead of inserting Smalltalk code after each production rule inside braces, "{}", we insert the class name inside of double braces, "{{}}". Also, instead of naming a variable for use in the Smalltalk code, we name a variable so that it will be included as an instance variable in the class we are defining.

Let''s start with annotating the grammar for the AST node classes that we wish to parse. We need to tell SmaCC where the AST node should be created and the name of the node''s class to create. In our example, we''ll start by creating three node classes: Expression, Binary, and Number.

<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";

Expression 
	: Expression "+" Expression {{Binary}}
	| Expression "-" Expression {{Binary}}
	| Expression "*" Expression {{Binary}}
	| Expression "/" Expression {{Binary}}
	| Expression "^" Expression {{Binary}}
	| "(" Expression ")" {{}}
	| Number
	;
Number 
	: <number> {{Number}}
	;

If you compile this grammar, SmaCC will complain that we need to define a root node. Since the root hasn''t been defined SmaCC compiles the grammar as if the {{...}} expressions where not there and generates the same parser as above. Notice that for the parenthesized expression, we are using "{{}}". This is a shortcut for "{{Expression}}" (the name of our production''s symbol). Notice that we didn''t annotate the last production in the Expression definition. Since it only contains a single item, Number, SmaCC will pull up its value which in this case will be a Number AST node.

Now, let''s add variable names to our rules:

<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";
%annotate_tokens;

Expression 
	: Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "*" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "/" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "^" ''operator'' Expression ''right'' {{Binary}}
	| "(" Expression ")" {{}}
	| Number
	;
Number 
	: <number> {{Number}}
	;

The first thing to notices is that we added the "%annotate_tokens;" directive. This directive tells SmaCC to automatically create an instance variable for every unnamed token and keyword in the grammar. In our example above, we have one unnamed token, <number>, and two unnamed keywords, "(" & ")". When SmaCC sees an unnamed token or keyword, it adds a variable that is named based on the item and appends Token to the name. For example, in our example above, SmaCC will use leftParenToken for "(", rightParenToken for ")", and numberToken for <number>. The SmaCCGrammar class>>tokenNameMap contains the mapping to convert the keyword characters into valid Smalltalk variable names. You can modify this dictionary if you wish to change the default names.

Notice that we did not name Expression in the "(" Expression ")" production rule. When you don''t name a symbol in a production, SmaCC tries to figure out what you want to do. In this case, SmaCC determines that the Expression symbol produces either a Binary or Number node. Since both of these are subclasses of the Expression, SmaCC will pull up the value of Expression and add the parentheses to that node. So, if you parse "(3 + 4)", you''ll get a Binary node instead of an Expression node.

Now we are ready to generate our AST. We need to add directives that tell SmaCC our root AST class node and the prefix and suffix of our classes.

<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";
%annotate_tokens;
%root Expression;
%prefix AST;
%suffix Node;

Expression 
	: Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "*" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "/" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "^" ''operator'' Expression ''right'' {{Binary}}
	| "(" Expression ")" {{}}
	| Number
	;
Number 
	: <number> {{Number}}
	;

When you compile this grammar, in addition to the normal parser and scanner classes, SmaCC will create ASTExpressionNode, ASTBinaryNode, and ASTNumberNode node classes and an ASTExpressionNodeVisitor class that implements the visitor pattern for the tree classes.

The ASTExpressionNode class will define two instance variables, leftParenTokens and rightParenTokens, that will hold the "(" and ")" tokens. Notices that these variables hold a collection of tokens instead of a single parenthesis token. SmaCC figured out that each expression node could contain multiple parentheses and made their variables hold a collection. Also, it pluralized the leftParentToken variable name to leftParenTokens. You can customize how it pluralizes names in the SmaCCVariableDefinition class (pluralNameBlock & pluralNames).

The ASTBinaryNode will be a subclass of ASTExpressionNode and will define three variables: left, operator, and right. The left and right instance variables will hold other ASTExpressionNodes and the operator instance variable will hold a token for the operator. Finally, the ASTNumberNode will be a subclass of ASTExpressionNode and will define a single instance variable, number, that holds the token for the number.

Now, if we inspect the result of parsing "3 + 4", we''ll get an something that looks like an Inspector on an ASTBinaryNode.

Let''s add function evaluation to our expression grammar:

<number> : [0-9]+ (\. [0-9]*) ? ;
<name> : [a-zA-Z]\w*;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";
%annotate_tokens;
%root Expression;
%prefix AST;
%suffix Node;

Expression 
	: Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "*" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "/" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "^" ''operator'' Expression ''right'' {{Binary}}
	| "(" Expression ")" {{}}
	| Number
	| Function
	;
Number 
	: <number> {{Number}}
	;
Function
	: <name> "(" ''leftParen'' _Arguments ")" ''rightParen'' {{}}
	;
_Arguments
	:
	| Arguments
	;
Arguments
	: Expression ''argument''
	| Arguments "," Expression ''argument''
	;

Now, if we inspect "Add(3, 4)", we''ll get something that looks like an ASTFunctionNode.

In addition to the generating the classes, SmaCC also generates the comparison methods for each AST node. For example, we can compare two parse nodes: "(ExpressionParser parse: ''3 + 4'') = (ExpressionParser parse: ''3+4'')". This returns true as whitespace is ignored. However, if we compare "(ExpressionParser parse: ''(3 + 4)'') = (ExpressionParser parse: ''3+4'')", we get false, since the first expression has parentheses. We can tell SmaCC to ignore these by adding the %ignore_variables directive:

<number> : [0-9]+ (\. [0-9]*) ? ;
<name> : [a-zA-Z]\w*;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";
%annotate_tokens;
%root Expression;
%prefix AST;
%suffix Node;
%ignore_variables leftParenToken rightParenToken;

Expression 
	: Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "*" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "/" ''operator'' Expression ''right'' {{Binary}}
	| Expression ''left'' "^" ''operator'' Expression ''right'' {{Binary}}
	| "(" Expression ")" {{}}
	| Number
	| Function
	;
Number 
	: <number> {{Number}}
	;
Function
	: <name> "(" ''leftParen'' _Arguments ")" ''rightParen'' {{}}
	;
_Arguments
	:
	| Arguments
	;
Arguments
	: Expression ''argument''
	| Arguments "," Expression ''argument''
	;

Now, we get true when we compare "(ExpressionParser parse: ''(3 + 4)'') = (ExpressionParser parse: ''3+4'')".

Finally, let''s subclass the generated visitor to create a visitor that evaluates the expressions. Here''s the code for Pharo:

ASTExpressionNodeVisitor subclass: #ExpressionEvaluator
	instanceVariableNames: ''functions''
	classInstanceVariableNames: ''
	category: ''!

!ExpressionEvaluator methodsFor: ''private''!

functions
	^functions
		ifNil: 
			[functions := (Dictionary new)
						at: ''Add'' put: [:a :b | a + b];
						yourself]! !

!ExpressionEvaluator methodsFor: ''visiting''!

visitBinary: aBinary
	| left right operation |
	left := self acceptNode: aBinary left.
	right := self acceptNode: aBinary right.
	operation := aBinary operator value.
	operation = ''^'' ifTrue: [^left ** right].
	^left perform: operation asSymbol with: right!

visitFunction: aFunction
	| function arguments |
	function := self functions at: aFunction nameToken value
				ifAbsent: 
					[self error: ''Function '' , 
						aFunction nameToken value , 
						'' is not defined''].
	arguments := aFunction arguments collect: [:each | self acceptNode: each].
	^function valueWithArguments: arguments asArray!

visitNumber: aNumber
	^aNumber numberToken value asNumber! !

Now we can evaluate "ExpressionEvaluator new accept: (ExpressionParser parse: ''Add(3,4) * 12 / 2 ^ (3 - 1) + 10'')" and get 31.'
		