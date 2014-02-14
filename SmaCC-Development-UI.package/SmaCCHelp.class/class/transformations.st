pages
transformations
	^ HelpTopic
		title: 'Transformations'
		contents:
'SmaCC Transformations

Once you have generated your AST using SmaCC, you can use SmaCC''s built in transformation support. Let''s add support for transforming our simple expressions generated from our AST example.

The first thing we need to do is to extend our grammar by adding two lines. The first line we need to add is the definition of a pattern for our language. When your grammar defines the <patternToken>, SmaCC uses this as the definition of a pattern for your language. For most languages, patterns are simply anything delimited by ` characters (e.g., `pattern`). The other line we need to add is the line to tell SmaCC to generate a GLR parser (%glr;). This allows SmaCC to parse all possible representations of a pattern expression. Here is our grammar with those two additional lines:

	<number> : [0-9]+ (\. [0-9]*) ? ;
	<name> : [a-zA-Z]\w*;
	<whitespace> : \s+;

	<patternToken> : \` [^\`]* \` ;
	%glr;

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
		| Function;
	Number : <number> {{Number}};
	Function
		: <name> "(" ''leftParen'' _Arguments ")" ''rightParen'' {{}};
	_Arguments
		:
		| Arguments;
	Arguments
		: Expression ''argument''
		| Arguments "," Expression ''argument'';

These changes modify our grammar to support parsing pattern matching expressions. Pattern matching expressions look like normal expressions, but may include pattern''s that are surrounded by the back quote, `, character. For example, "`a` + 1" is a simple pattern matching expression that matches any expression + 1. Once the pattern has been matched, we can supply a replacement expression that uses the pattern variables from our match. Replacement expressions are strings that can contain back quoted variables. These back quoted variables are replaced with their source from their corresponding matched node. For example, if we are searching for "`a` + 1", we can supply a replacement expression like "1 + `a`". This pattern will match "(3 + 4) + 1". When we perform the replacement we take the literal "1 + " part of the string and concatenate the value of the node that matched `a`. In this case, we would concatenate "(3 + 4)" to give us "1 + (3 + 4)".

As an example, let''s rewrite addition expressions using reverse Polish notation. Our search pattern is "`a` + `b`" and our replacement expression is "`a` `b` +".

	| rewriter compositeRewrite rewrite matcher transformation |
	compositeRewrite := SmaCCRewriteFile new.
	compositeRewrite parserClass: ExpressionParser.
	matcher := SmaCCRewriteTreeMatch new.
	matcher source: ''`a` + `b`''.
	transformation := SmaCCRewriteStringTransformation new.
	transformation string: ''`a` `b` +''.
	rewrite := SmaCCRewrite 
		comment: ''Postfix rewriter'' 
		match: matcher
		transformation: transformation.
	compositeRewrite addTransformation: rewrite.
	rewriter := SmaCCRewriteEngine new.
	rewriter rewriteRule: compositeRewrite.
	rewriter rewriteTree: (ExpressionParser parse: ''(3 + 4) + (4 + 3)'')

This code rewrites "(3 + 4) + (4 + 3)" in RPN format and returns "3 4 + 4 3 + +". The first match that this finds is `a` = (3 + 4) and `b` = (4 + 3). Inside our replacement expression, we refer to `a` and `b`, so we first process those expression for more transformations. Since both contain other addition expressions, we rewrite both expressions to get `a` = 3 4 + and `b` = 4 3 +.

Here''s the same example, using SmaCC special rewrite syntax.

	| rewriter rewriteExpression |
	rewriteExpression := 
		''Parser: ExpressionParser
		>>>`a` + `b`<<<
		->
		>>>`a` `b` +<<<''.
	rewriter := SmaCCRewriteEngine new.
	rewriter rewriteRule: (SmaCCRewriteRuleFileParser parse: rewriteExpression).
	rewriter rewriteTree: (ExpressionParser parse: ''(3 + 4) + (4 + 3)'')

Let''s extend our RPN rewriter to support other expressions besides addition. Now we could do that by providing rewrites for all possible operators (+, -, *, /, ^), but it would be better if we could do it with patterns. We may wish to do use "`a` `op` `b`", but the pattern `op` will only match AST nodes and not a token (+). We can tell SmaCC to match tokens by using "`a` `op{beToken}` `b`". Here''s the rewrite expression that works for all expressions:

	Parser: ExpressionParser
	>>>`a` `op{beToken}` `b`<<<
	->
	>>>`a` `b` `op`<<<

If we transform "(3 + 4) * (5 - 2) ^ 3", we''ll get "3 4 + 5 2 - 3 ^ *".'
		