Class {
	#name : #JSParser,
	#superclass : #SmaCCGLRParser,
	#instVars : [
		'lastInsertedSemicolonPosition'
	],
	#classInstVars : [
		'keywords'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #'generated-accessing' }
JSParser class >> cacheId [
	^'2017-05-23T21:14:54.89751+02:00'
]

{ #category : #generated }
JSParser class >> definitionComment [
"%root Program;
%prefix JS;
%suffix Node;

%start Expression Statement Program ;

%ignore_variables semicolon comma leftParen rightParen leftBracket rightBracket leftBrace rightBrace colonToken;

%hierarchy Literal (
	NullLiteral 
	BooleanLiteral 
	NumericLiteral 
	StringLiteral
	RegularExpressionLiteral
);
%hierarchy Expression (
	ThisExpression
	Literal
	NameExpression
	ArrayLiteral
	ObjectLiteral
	Function
	IndexedPropertyExpression
	NamedPropertyExpression
	NewExpression
	CallExpression
	PostfixExpression
	UnaryExpression
	BinaryExpression
	ConditionalExpression
	AssignmentExpression
	CommaExpression
);
%hierarchy Statement (
	BlockStatement
	VariableStatement
	EmptyStatement
	ExpressionStatement
	IfStatement
	DoWhileStatement
	WhileStatement
	ForStatement
	ForInStatement
	ForOfStatement
	ContinueStatement
	BreakStatement
	ReturnStatement
	WithStatement
	SwitchStatement
	LabelledStatement
	ThrowStatement
	TryStatement
	DebuggerStatement
);

%glr;

%id <semicolon> <identifier> <slash> <slashEqual> <regular_expression> <identifierName>;

%right ""else"";

<semicolon>
:	\;
;
<slash>
:	\/
;
<slashEqual>
:	\/\=
;

<comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<hex>
:	[0-9a-fA-F]
;
<identifier_start>
:	<isLetter> | \$ | _ | (\\ u <hex>{4,4})
;
<identifier_part>	#TODO
:	<identifier_start> | <isDigit> 
;
<identifier>
:	<identifier_start> <identifier_part>*
;
<identifierName>
:	<identifier>
;
<whitespace>
:	<isSeparator>+
;
<escape_sequence>
:	[^\r\n] | (x <hex>{2,2}) | (u <hex>{4,4})
;
<escape>
:	\\  <escape_sequence>
;
<line_continuation>
:	\\ (\r | \n | (\r\n))
;
<string>
:	(\"" ([^\""\\\r\n] | <line_continuation> | <escape>)* \"")+
|	(\' ([^\'\\\r\n] | <line_continuation> | <escape>)* \')+
;
<decimal_integer>
#:	0 | ([1-9][0-9]*)
:	[0-9]+	# numbers that start with 0's should be octals, but node appears to allow 09 (e.g., (1 + 09) == (1 + 011))
;
<decimal_digits>
:	[0-9]+
;
<exponent_part>
:	[eE] [\+\-]? <decimal_digits>
;
<decimal>
:	(<decimal_integer> \. <decimal_digits>? <exponent_part>?)
|	(\. <decimal_digits> <exponent_part>?)
|	(<decimal_integer> <exponent_part>?)
;
<hex_integer>
:	0 [xX] [0-9A-Fa-f]+
;
<numeric>
:	<decimal> | <hex_integer>
;
<regular_expression_backslash_sequence>
:	\\ [^\r\n]
;
<regular_expression_class_chars>
:	([^\\\]] | <regular_expression_backslash_sequence>)*
;
<regular_expression_class>
:	\[ <regular_expression_class_chars> \]
;
<regular_expression_first_char>
:	[^\\\/\[\*\r\n] | <regular_expression_backslash_sequence> | <regular_expression_class>
;
<regular_expression_char>
:	[^\\\/\[\r\n] | <regular_expression_backslash_sequence> | <regular_expression_class>
;
<regular_expression_chars>
:	<regular_expression_char>*
;
<regular_expression_body>
:	<regular_expression_first_char> <regular_expression_chars>
;
<regular_expression_flags>
:	<identifier>*
;
<regular_expression>
:	\/ <regular_expression_body> \/ <regular_expression_flags>
;
<patternToken>
	: (\`  [^\`]* \`)+
	;

goal : Program;

# A.3 Expressions
PrimaryExpression
:	""this"" 'thisToken' {{ThisExpression}}
|	<identifier> 'name' {{NameExpression}}	# mod
|	Literal 
|	ArrayLiteral 
|	ObjectLiteral 
|	""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
;
ArrayLiteral 
#:	""["" Elisionopt ""]"" 
#:	""["" 'leftBracket' ""]"" 'rightBracket' {{}}	# mod
:	""["" 'leftBracket' ElementList ""]"" 'rightBracket' {{}}
#|	""["" ElementList "","" Elisionopt ""]""
;
############OLD############
#ElementList
##:	Elisionopt 
#:	Elision	# mod
#|	AssignmentExpression 
##|	ElementList "","" Elisionopt AssignmentExpression
#|	ElementList "","" Elision	#mod
#|	ElementList "","" AssignmentExpression	#mod
#;
#Elision
#:	"","" 'comma'
##|	Elision "",""
#;
###########################
ElementList
:	ElementExpression 'expression'
|	ElementList "","" 'comma' ElementExpression 'expression'
;
ElementExpression
:
|	AssignmentExpression
;
#####################
ObjectLiteral  
:	""{"" 'leftBrace' ""}"" 'rightBrace' {{}}
|	""{"" 'leftBrace' PropertyNameAndValueList ""}"" 'rightBrace' {{}}
|	""{"" 'leftBrace' PropertyNameAndValueList "","" 'comma' ""}"" 'rightBrace' {{}}
;
PropertyNameAndValueList 
:	PropertyAssignment 'assignment'
|	PropertyNameAndValueList "","" 'comma' PropertyAssignment 'assignment'
;
PropertyAssignment
:	PropertyName 'key' "":"" 'colonToken' AssignmentExpression 'value' {{}}
|	""get"" 'getToken' PropertyName 'key' ""("" 'leftParen' "")"" 'rightParen' ""{"" 'leftBrace' FunctionBody ""}"" 'rightBrace' {{GetPropertyAssignment}}
|	""set"" 'setToken' PropertyName 'key' ""("" 'leftParen' PropertySetParameterList "")"" 'rightParen' ""{"" 'leftBrace' FunctionBody ""}"" 'rightBrace' {{SetPropertyAssignment}}
;
PropertyName 
:	<identifierName> 'name' {{NameExpression}}
|	StringLiteral 'name' {{NameExpression}}
|	NumericLiteral 'name' {{NameExpression}}
;
PropertySetParameterList 
:	<identifier>	'variable'	# mod
;
MemberExpression 
:	PrimaryExpression 
|	FunctionExpression 
|	MemberExpression 'expression' ""["" 'leftBracket' Expression 'fieldExpression' ""]"" 'rightBracket' {{IndexedPropertyExpression}}
|	MemberExpression 'expression' ""."" 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
|	""new"" 'newToken' MemberExpression 'expression' Arguments {{NewExpression}}
;
NewExpression 
:	MemberExpression 
|	""new"" 'newToken' NewExpression 'expression' {{}}
;
CallExpression 
:	MemberExpression 'expression' Arguments {{}}
|	CallExpression 'expression' Arguments {{}}
|	CallExpression 'expression' ""["" 'leftBracket' Expression 'fieldExpression' ""]"" 'rightBracket' {{IndexedPropertyExpression}}
|	CallExpression 'expression' ""."" 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
;
Arguments 
:	""("" 'left' "")"" 'right'
|	""("" 'left' ArgumentList "")"" 'right'
;
ArgumentList 
:	AssignmentExpression 'argument'
|	ArgumentList "","" 'comma' AssignmentExpression 'argument'
;
LeftHandSideExpression 
:	NewExpression 
|	CallExpression
;
PostfixExpression 
:	LeftHandSideExpression 
|	LeftHandSideExpression 'expression' ""++"" 'operator' {{}}
|	LeftHandSideExpression 'expression' ""--"" 'operator' {{}}
;
UnaryExpression 
:	PostfixExpression 
|	""delete"" 'operator' UnaryExpression 'expression' {{}}
|	""void"" 'operator' UnaryExpression 'expression' {{}}
|	""typeof"" 'operator' UnaryExpression 'expression' {{}}
|	""++"" 'operator' UnaryExpression 'expression' {{}}
|	""--"" 'operator' UnaryExpression 'expression' {{}}
|	""+"" 'operator' UnaryExpression 'expression' {{}}
|	""-"" 'operator' UnaryExpression 'expression' {{}}
|	""~"" 'operator' UnaryExpression 'expression' {{}} 
|	""!"" 'operator' UnaryExpression 'expression' {{}}
;
MultiplicativeExpression 
:	UnaryExpression 
|	MultiplicativeExpression 'leftExpression' ""*"" 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' <slash> 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' ""%"" 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
;
AdditiveExpression 
:	MultiplicativeExpression 
|	AdditiveExpression 'leftExpression' ""+"" 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
|	AdditiveExpression 'leftExpression' ""-"" 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
;
ShiftExpression 
:	AdditiveExpression 
|	ShiftExpression 'leftExpression' ""<<"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' "">>"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' "">>>"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
;
RelationalExpression 
:	ShiftExpression 
|	RelationalExpression 'leftExpression' ""<"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' "">"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""<="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' "">="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""instanceof"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""in"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
;
RelationalExpressionNoIn 
:	ShiftExpression 
|	RelationalExpressionNoIn 'leftExpression' ""<"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpressionNoIn 'leftExpression' "">"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpressionNoIn 'leftExpression' ""<="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpressionNoIn 'leftExpression' "">="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpressionNoIn 'leftExpression' ""instanceof"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
;
EqualityExpression 
:	RelationalExpression 
|	EqualityExpression 'leftExpression' ""=="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""!="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""==="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""!=="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
;
EqualityExpressionNoIn 
:	RelationalExpressionNoIn 
|	EqualityExpressionNoIn 'leftExpression' ""=="" 'operator' RelationalExpressionNoIn 'rightExpression' {{BinaryExpression}}
|	EqualityExpressionNoIn 'leftExpression' ""!="" 'operator' RelationalExpressionNoIn 'rightExpression' {{BinaryExpression}}
|	EqualityExpressionNoIn 'leftExpression' ""==="" 'operator' RelationalExpressionNoIn 'rightExpression' {{BinaryExpression}}
|	EqualityExpressionNoIn 'leftExpression' ""!=="" 'operator' RelationalExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
BitwiseANDExpression 
:	EqualityExpression 
|	BitwiseANDExpression 'leftExpression'""&"" 'operator' EqualityExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseANDExpressionNoIn 
:	EqualityExpressionNoIn 
|	BitwiseANDExpressionNoIn 'leftExpression' ""&"" 'operator' EqualityExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
BitwiseXORExpression 
:	BitwiseANDExpression 
|	BitwiseXORExpression 'leftExpression' ""^"" 'operator' BitwiseANDExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseXORExpressionNoIn 
:	BitwiseANDExpressionNoIn 
|	BitwiseXORExpressionNoIn 'leftExpression' ""^"" 'operator' BitwiseANDExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
BitwiseORExpression 
:	BitwiseXORExpression 
|	BitwiseORExpression 'leftExpression' ""|"" 'operator' BitwiseXORExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseORExpressionNoIn 
:	BitwiseXORExpressionNoIn 
|	BitwiseORExpressionNoIn 'leftExpression' ""|"" 'operator' BitwiseXORExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
LogicalANDExpression 
:	BitwiseORExpression 
|	LogicalANDExpression 'leftExpression' ""&&"" 'operator' BitwiseORExpression 'rightExpression' {{BinaryExpression}}
;
LogicalANDExpressionNoIn 
:	BitwiseORExpressionNoIn 
|	LogicalANDExpressionNoIn 'leftExpression' ""&&"" 'operator' BitwiseORExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
LogicalORExpression 
:	LogicalANDExpression 
|	LogicalORExpression 'leftExpression' ""||"" 'operator' LogicalANDExpression 'rightExpression' {{BinaryExpression}}
;
LogicalORExpressionNoIn 
:	LogicalANDExpressionNoIn 
|	LogicalORExpressionNoIn 'leftExpression' ""||"" 'operator' LogicalANDExpressionNoIn 'rightExpression' {{BinaryExpression}}
;
ConditionalExpression 
:	LogicalORExpression 
|	LogicalORExpression 'condition' ""?"" 'questionMarkToken' AssignmentExpression 'trueExpression' "":"" 'colonToken' AssignmentExpression 'falseExpression' {{}}
;
ConditionalExpressionNoIn 
:	LogicalORExpressionNoIn 
|	LogicalORExpressionNoIn 'condition' ""?"" 'questionMarkToken' AssignmentExpressionNoIn 'trueExpression' "":"" 'colonToken' AssignmentExpressionNoIn 'falseExpression' {{ConditionalExpression}}
;
AssignmentExpression 
:	ConditionalExpression 
|	LeftHandSideExpression 'lhs' AssignmentOperator 'operator' AssignmentExpression 'rhs' {{}}
;
AssignmentExpressionNoIn 
:	ConditionalExpressionNoIn 
|	LeftHandSideExpression 'lhs' AssignmentOperator 'operator' AssignmentExpressionNoIn 'rhs' {{AssignmentExpression}}
;
AssignmentOperator
:	""=""
|	""*=""
|	<slashEqual>
|	""%=""
|	""+=""
|	""-=""
|	""<<=""
|	"">>=""
|	"">>>=""
|	""&=""
|	""^=""
|	""|=""
;
Expression
:	AssignmentExpression 
|	Expression 'expression' "","" 'comma' AssignmentExpression 'expression' {{CommaExpression}}
;
ExpressionNoIn
:	AssignmentExpressionNoIn 
|	ExpressionNoIn 'expression' "","" 'comma' AssignmentExpressionNoIn 'expression' {{CommaExpression}}
;
#A.4 Statements
Statement 
:	Block 
|	VariableStatement 
|	EmptyStatement 
|	ExpressionStatement 
|	IfStatement 
|	IterationStatement 
|	ContinueStatement 
|	BreakStatement 
|	ReturnStatement 
|	WithStatement 
|	LabelledStatement 
|	SwitchStatement 
|	ThrowStatement 
|	TryStatement 
|	DebuggerStatement
;
Block 
:	""{"" 'leftBrace' StatementListopt ""}"" 'rightBrace' {{BlockStatement}}
;
StatementList 
:	Statement 'statement'
|	StatementList Statement 'statement'
;
VariableStatement 
:	VarType 'varToken' VariableDeclarationList <semicolon> 'semicolon' {{}}
;
VarType
:	""var""
|	""const""
|	""let""
;
VariableDeclarationList 
:	VariableDeclaration 'variable'
|	VariableDeclarationList "","" 'comma' VariableDeclaration 'variable'
;
VariableDeclarationListNoIn 
:	VariableDeclarationNoIn 'variable'
|	VariableDeclarationListNoIn "","" 'comma' VariableDeclarationNoIn 'variable'
;
VariableDeclaration 
:	<identifier> 'variable' Initialiseropt {{VariableDeclaration}}	# mod
;
VariableDeclarationNoIn 
:	<identifier> 'variable' InitialiserNoInopt {{VariableDeclaration}}	# mod
;
Initialiser 
:	""="" 'equalsToken' AssignmentExpression 'value'
;
InitialiserNoIn 
:	""="" 'equalsToken' AssignmentExpressionNoIn 'value'
;
EmptyStatement 
:	<semicolon> 'semicolon' {{}}
;
ExpressionStatement 
:	Expression 'expression' <semicolon> 'semicolon' {{}}
;
IfStatement 
:	""if"" 'ifToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' Statement 'trueStatement' ""else"" 'elseToken' Statement 'elseStatement' {{}}
|	""if"" 'ifToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' Statement 'trueStatement' {{}}
;
IterationStatement 
:	""do"" 'doToken' Statement 'statement' ""while"" 'whileToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' <semicolon> 'semicolon' {{DoWhileStatement}}
|	""while"" 'whileToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' Statement 'statement' {{WhileStatement}}
|	""for"" 'forToken' ""("" 'leftParen' ExpressionNoInopt 'initialExpression'<semicolon> 'semicolon' Expressionopt 'condition'<semicolon> 'semicolon' Expressionopt 'iteratorExpression' "")"" 'rightParen' Statement 'statement' {{ForStatement}}
|	""for"" 'forToken' ""("" 'leftParen' VarType 'varToken' VariableDeclarationListNoIn <semicolon> 'semicolon' Expressionopt 'condition' <semicolon> 'semicolon' Expressionopt 'iteratorExpression' "")"" 'rightParen' Statement 'statement' {{ForStatement}}
|	""for"" 'forToken' ""("" 'leftParen' LeftHandSideExpression 'variable' ""in"" 'inToken' Expression 'expression' "")"" 'rightParen' Statement 'statement' {{ForInStatement}}
|	""for"" 'forToken' ""("" 'leftParen' VarType 'varToken' VariableDeclarationNoIn 'variable' ""in"" 'inToken' Expression 'expression' "")"" 'rightParen' Statement  'statement' {{ForInStatement}}
|	""for"" 'forToken' ""("" 'leftParen' LeftHandSideExpression 'variable' ""of"" 'ofToken' Expression 'expression' "")"" 'rightParen' Statement 'statement' {{ForOfStatement}}
|	""for"" 'forToken' ""("" 'leftParen' VarType 'varToken' VariableDeclarationNoIn 'variable' ""of"" 'ofToken' Expression 'expression' "")"" 'rightParen' Statement  'statement' {{ForOfStatement}}
;
ContinueStatement 
:	""continue"" 'continueToken' Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
BreakStatement 
:	""break"" 'breakToken' Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
ReturnStatement  
:	""return"" 'returnToken' Expressionopt 'expression' <semicolon> 'semicolon' {{}}
;
WithStatement 
:	""with"" 'withToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' Statement 'statement' {{}}
;
SwitchStatement 
:	""switch"" 'switchToken' ""("" 'leftParen' Expression 'expression' "")"" 'rightParen' CaseBlock {{}}
;
CaseBlock 
:	""{"" 'leftBrace' CaseClausesopt ""}"" 'rightBrace' 
|	""{"" 'leftBrace' CaseClausesopt DefaultClause 'clause' CaseClausesopt ""}"" 'rightBrace'
;
CaseClauses 
:	CaseClause 'clause'
|	CaseClauses CaseClause 'clause'
;
CaseClause 
:	""case"" 'caseToken' Expression 'caseExpression' "":"" 'colonToken' StatementListopt {{}}
;
DefaultClause 
:	""default"" 'defaultToken' "":"" 'colonToken' StatementListopt  {{}}
;
LabelledStatement 
:	<identifier> 'label' "":"" 'colonToken' Statement 'statement' {{}}	# mod
;
ThrowStatement 
:	""throw"" 'throwToken' Expression 'expression' <semicolon> 'semicolon' {{}}
;
TryStatement 
:	""try"" 'tryToken' Block 'tryBlock' Catch {{}}
|	""try"" 'tryToken' Block 'tryBlock' Finally {{}}
|	""try"" 'tryToken' Block 'tryBlock' Catch Finally {{}}
;
Catch 
:	""catch"" 'catchToken' ""("" 'leftParen' <identifier> 'exceptionType' "")"" 'rightParen' Block 'catchBlock'	# mod
;
Finally 
:	""finally"" 'finallyToken' Block 'finallyBlock'
;
DebuggerStatement 
:	""debugger"" 'debuggerToken' <semicolon> 'semicolon' {{}}
;
#A.5 Functions and Programs
#FunctionDeclaration 
#:	""function"" 'functionToken' <identifier> 'name' ""("" 'leftParen' FormalParameterListopt "")"" 'rightParen' ""{"" 'leftBrace' FunctionBody ""}"" 'rightBrace' {{FunctionDeclaration}}
#;
FunctionExpression 
:	""function"" 'functionToken' Identifieropt 'name' ""("" 'leftParen' FormalParameterListopt "")"" 'rightParen' ""{"" 'leftBrace' FunctionBody ""}"" 'rightBrace' {{Function}}
;
FormalParameterList 
:	<identifier> 'argument'	# mod
|	FormalParameterList "","" 'comma' <identifier> 'argument'	# mod
;
FunctionBody 
:	SourceElementsopt
;
Program  
:	SourceElementsopt  {{File}}
;
SourceElements 
:	SourceElement 'statement'
|	SourceElements SourceElement 'statement'
;
SourceElement  
:	Statement 
#|	FunctionDeclaration
;

#Optional
CaseClausesopt
:
|	CaseClauses
;
Expressionopt
:
|	Expression
;
ExpressionNoInopt
:
|	ExpressionNoIn
;
FormalParameterListopt
:
|	FormalParameterList
;
Identifieropt
:
|	<identifier>
;
Initialiseropt
:
|	Initialiser
;
InitialiserNoInopt
:
|	InitialiserNoIn
;
SourceElementsopt
:
|	SourceElements
;
StatementListopt
:
|	StatementList
;


Literal
:	NullLiteral 'value' {{NullLiteral}}
|	BooleanLiteral 'value' {{BooleanLiteral}}
|	NumericLiteral 'value' {{NumericLiteral}}
|	StringLiteral 'value' {{StringLiteral}}
|	RegularExpressionLiteral 'value' {{RegularExpressionLiteral}}
;
NullLiteral
:	""null""
;
BooleanLiteral
:	""true""
|	""false""
;

#Identifier
#:	IdentifierName
#;
#IdentifierName
#:	<identifierName>
#;
StringLiteral
:	<string>
;
NumericLiteral
:	<numeric>
;
RegularExpressionLiteral
:	<regular_expression>
;"
]

{ #category : #'file types' }
JSParser class >> fileExtension [
	^ '.js'
]

{ #category : #'file types' }
JSParser class >> fileExtensionType [
	^ 'Javascript files'
]

{ #category : #private }
JSParser class >> keywords [
	^ keywords
		ifNil:
			[ keywords := #(#break #do #instanceof #typeof #case #else #var #catch #finally #return #void #continue #for #switch #while #debugger #function #this #with #default #if #throw #delete #in #try)
				asSet collect: [ :each | each asString ] ]
]

{ #category : #'generated-accessing' }
JSParser class >> scannerClass [
	^JSScanner
]

{ #category : #generated }
JSParser class >> startingStateForExpression [
	^ 2
]

{ #category : #generated }
JSParser class >> startingStateForProgram [
	^ 4
]

{ #category : #generated }
JSParser class >> startingStateForStatement [
	^ 3
]

{ #category : #generated }
JSParser class >> startingStateForgoal [
	^ 1
]

{ #category : #private }
JSParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	(currentToken ids first ~= scanner identifierId
		and: [ (currentToken ids includes: scanner identifierId)
				and: [ (self keywords includes: currentToken value) not ] ])
		ifTrue: [ self addActionsFor: scanner identifierId to: actions ].
	(currentToken ids first ~= scanner identifierNameId
		and: [ currentToken ids includes: scanner identifierNameId ])
		ifTrue: [ self addActionsFor: scanner identifierNameId to: actions ].
	(currentToken ids first == scanner regular_expressionId
		and: [ actions isEmpty ])
		ifTrue: [ (currentToken value at: 2) == $=
				ifTrue: [ currentToken := scanner tokenClass
						value: '/='
						start: currentToken startPosition
						ids: (Array with: scanner slashEqualId).
					self position: currentToken startPosition + 1 ]
				ifFalse: [ currentToken := scanner tokenClass
						value: '/'
						start: currentToken startPosition
						ids: (Array with: scanner slashId).
					self position: currentToken startPosition ].
			^ self actionsForCurrentToken ].
	(actions isEmpty
		and: [ lastInsertedSemicolonPosition < scanner position ])
		ifTrue: [ self addActionsFor: self scanner semicolonId to: actions.
			lastInsertedSemicolonPosition := scanner position.
			actions notEmpty
				ifTrue: [ self position: currentToken startPosition - 1.
					currentToken := currentToken class
						value: ';'
						start: nil
						ids: (Array with: self scanner semicolonId) ] ].
	^ actions
]

{ #category : #generated }
JSParser >> ambiguousTransitions [
^#(
#[ 0 18 1 177]
	).
]

{ #category : #private }
JSParser >> handleError: anInteger [
	(currentToken value = ';' and: [ currentToken startPosition isNil ])
		ifTrue: [ currentToken := nil.
			self getNextToken ].
	^ super handleError: anInteger
]

{ #category : #'initialize/release' }
JSParser >> initialize [
	super initialize.
	lastInsertedSemicolonPosition := -1
]

{ #category : #private }
JSParser >> keywords [
	^ self class keywords
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArguments2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayLiteral1: nodes [
	| result |
	result := JSArrayLiteralNode new.
	result leftBracket: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForAssignmentExpression2: nodes [
	| result |
	result := JSAssignmentExpressionNode new.
	result lhs: (nodes at: 1).
	result operator: (nodes at: 2).
	result rhs: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBlock1: nodes [
	| result |
	result := JSBlockStatementNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBooleanLiteral2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBreakStatement1: nodes [
	| result |
	result := JSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result label: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCallExpression1: nodes [
	| result |
	result := JSCallExpressionNode new.
	result expression: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result right: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result arguments.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseBlock1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseBlock2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 2).
	self addAll: (nodes at: 4) to: (result at: 2).
	result at: 3 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseClause1: nodes [
	| result |
	result := JSCaseClauseNode new.
	result caseToken: (nodes at: 1).
	result caseExpression: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCatch1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForConditionalExpression2: nodes [
	| result |
	result := JSConditionalExpressionNode new.
	result condition: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForContinueStatement1: nodes [
	| result |
	result := JSContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result label: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForDebuggerStatement1: nodes [
	| result |
	result := JSDebuggerStatementNode new.
	result debuggerToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForDefaultClause1: nodes [
	| result |
	result := JSDefaultClauseNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForElementList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForElementList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForEmptyStatement1: nodes [
	| result |
	result := JSEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExpression2: nodes [
	| result |
	result := JSCommaExpressionNode new.
	result addNode: (nodes at: 1) to: result expressions.
	result comma: (nodes at: 2).
	result addNode: (nodes at: 3) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExpressionStatement1: nodes [
	| result |
	result := JSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFinally1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFormalParameterListopt1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFunctionExpression1: nodes [
	| result |
	result := JSFunctionNode new.
	result functionToken: (nodes at: 1).
	result name: (nodes at: 2).
	result addToken: (nodes at: 3) to: result leftParens.
	result addTokens: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result rightParens.
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIfStatement1: nodes [
	| result |
	result := JSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result elseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIfStatement2: nodes [
	| result |
	result := JSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForInitialiseropt1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement1: nodes [
	| result |
	result := JSDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement2: nodes [
	| result |
	result := JSWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement3: nodes [
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initialExpression: (nodes at: 3).
	result addToken: (nodes at: 4) to: result semicolons.
	result condition: (nodes at: 5).
	result addToken: (nodes at: 6) to: result semicolons.
	result iteratorExpression: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement4: nodes [
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result varToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result variables.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result semicolons.
	result condition: (nodes at: 6).
	result addToken: (nodes at: 7) to: result semicolons.
	result iteratorExpression: (nodes at: 8).
	result rightParen: (nodes at: 9).
	result statement: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement5: nodes [
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result variable: (nodes at: 3).
	result inToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement6: nodes [
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result varToken: (nodes at: 3).
	result variable: (nodes at: 4).
	result inToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result rightParen: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement7: nodes [
	| result |
	result := JSForOfStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result variable: (nodes at: 3).
	result ofToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement8: nodes [
	| result |
	result := JSForOfStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result varToken: (nodes at: 3).
	result variable: (nodes at: 4).
	result ofToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result rightParen: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLabelledStatement1: nodes [
	| result |
	result := JSLabelledStatementNode new.
	result label: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral1: nodes [
	| result |
	result := JSNullLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral2: nodes [
	| result |
	result := JSBooleanLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral3: nodes [
	| result |
	result := JSNumericLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral4: nodes [
	| result |
	result := JSStringLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral5: nodes [
	| result |
	result := JSRegularExpressionLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression3: nodes [
	| result |
	result := JSIndexedPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result fieldExpression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression4: nodes [
	| result |
	result := JSNamedPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression5: nodes [
	| result |
	result := JSNewExpressionNode new.
	result newToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result right: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result arguments.
	result addTokens: ((nodes at: 3) at: 4) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMultiplicativeExpression4: nodes [
	| result |
	result := JSBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNewExpression2: nodes [
	| result |
	result := JSNewExpressionNode new.
	result newToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral1: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral2: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result assignments.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral3: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result assignments.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPostfixExpression3: nodes [
	| result |
	result := JSPostfixExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPrimaryExpression1: nodes [
	| result |
	result := JSThisExpressionNode new.
	result thisToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPrimaryExpression2: nodes [
	| result |
	result := JSNameExpressionNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPrimaryExpression6: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForProgram1: nodes [
	| result |
	result := JSFileNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPropertyAssignment1: nodes [
	| result |
	result := JSPropertyAssignmentNode new.
	result key: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPropertyAssignment2: nodes [
	| result |
	result := JSGetPropertyAssignmentNode new.
	result getToken: (nodes at: 1).
	result key: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result statements.
	result rightBrace: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPropertyAssignment3: nodes [
	| result |
	result := JSSetPropertyAssignmentNode new.
	result setToken: (nodes at: 1).
	result key: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result variable: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForReturnStatement1: nodes [
	| result |
	result := JSReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSourceElements1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSourceElements2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSourceElementsopt1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSourceElementsopt2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchStatement1: nodes [
	| result |
	result := JSSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result clauses.
	result rightBrace: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForThrowStatement1: nodes [
	| result |
	result := JSThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement1: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result catchToken: ((nodes at: 3) at: 1).
	result leftParen: ((nodes at: 3) at: 2).
	result exceptionType: ((nodes at: 3) at: 3).
	result rightParen: ((nodes at: 3) at: 4).
	result catchBlock: ((nodes at: 3) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement2: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result finallyToken: ((nodes at: 3) at: 1).
	result finallyBlock: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement3: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result catchToken: ((nodes at: 3) at: 1).
	result leftParen: ((nodes at: 3) at: 2).
	result exceptionType: ((nodes at: 3) at: 3).
	result rightParen: ((nodes at: 3) at: 4).
	result catchBlock: ((nodes at: 3) at: 5).
	result finallyToken: ((nodes at: 4) at: 1).
	result finallyBlock: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForUnaryExpression8: nodes [
	| result |
	result := JSUnaryExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForVariableDeclaration1: nodes [
	| result |
	result := JSVariableDeclarationNode new.
	result variable: (nodes at: 1).
	result equalsToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForVariableStatement1: nodes [
	| result |
	result := JSVariableStatementNode new.
	result varToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result variables.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForWithStatement1: nodes [
	| result |
	result := JSWithStatementNode new.
	result withToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #generated }
JSParser >> reduceTable [
^#(
	#(174 0 #reduceActionForSourceElementsopt1:) 
	#(178 1 #reduceActionForBooleanLiteral2:) 
	#(96 0 #nil) 
	#(151 0 #reduceActionForSourceElementsopt1:) 
	#(94 1 #reduceActionForPrimaryExpression1:) 
	#(163 0 #nil) 
	#(164 0 #nil) 
	#(177 1 #reduceActionForBooleanLiteral2:) 
	#(153 1 #reduceActionForBooleanLiteral2:) 
	#(138 1 #reduceActionForEmptyStatement1:) 
	#(94 1 #reduceActionForPrimaryExpression2:) 
	#(103 1 #reduceActionForBooleanLiteral2:) 
	#(104 1 #reduceActionForBooleanLiteral2:) 
	#(179 1 #reduceActionForBooleanLiteral2:) 
	#(94 1 #reduceActionForBooleanLiteral2:) 
	#(175 1 #reduceActionForBooleanLiteral2:) 
	#(106 1 #reduceActionForBooleanLiteral2:) 
	#(185 1 #reduceActionForBooleanLiteral2:) 
	#(91 1 #reduceActionForLiteral4:) 
	#(91 1 #reduceActionForLiteral3:) 
	#(108 1 #reduceActionForBooleanLiteral2:) 
	#(111 1 #reduceActionForBooleanLiteral2:) 
	#(112 1 #reduceActionForBooleanLiteral2:) 
	#(113 1 #reduceActionForBooleanLiteral2:) 
	#(114 1 #reduceActionForBooleanLiteral2:) 
	#(115 1 #reduceActionForBooleanLiteral2:) 
	#(116 1 #reduceActionForBooleanLiteral2:) 
	#(117 1 #reduceActionForBooleanLiteral2:) 
	#(119 1 #reduceActionForBooleanLiteral2:) 
	#(121 1 #reduceActionForBooleanLiteral2:) 
	#(123 1 #reduceActionForBooleanLiteral2:) 
	#(125 1 #reduceActionForBooleanLiteral2:) 
	#(127 1 #reduceActionForBooleanLiteral2:) 
	#(129 1 #reduceActionForBooleanLiteral2:) 
	#(131 1 #reduceActionForBooleanLiteral2:) 
	#(97 1 #reduceActionForBooleanLiteral2:) 
	#(93 1 #reduceActionForBooleanLiteral2:) 
	#(181 1 #reduceActionForProgram1:) 
	#(176 1 #reduceActionForSourceElements1:) 
	#(174 1 #reduceActionForSourceElementsopt2:) 
	#(91 1 #reduceActionForLiteral1:) 
	#(91 1 #reduceActionForLiteral2:) 
	#(91 1 #reduceActionForLiteral5:) 
	#(180 1 #reduceActionForBooleanLiteral2:) 
	#(113 2 #reduceActionForUnaryExpression8:) 
	#(95 1 #reduceActionForElementList1:) 
	#(96 1 #reduceActionForBooleanLiteral2:) 
	#(186 2 #reduceActionForObjectLiteral1:) 
	#(100 1 #reduceActionForPrimaryExpression2:) 
	#(152 1 #reduceActionForSourceElements1:) 
	#(98 1 #reduceActionForElementList1:) 
	#(151 1 #reduceActionForSourceElementsopt2:) 
	#(108 2 #reduceActionForNewExpression2:) 
	#(163 1 #reduceActionForBooleanLiteral2:) 
	#(164 1 #reduceActionForBooleanLiteral2:) 
	#(150 2 #reduceActionForDebuggerStatement1:) 
	#(162 0 #nil) 
	#(109 2 #reduceActionForCallExpression1:) 
	#(112 2 #reduceActionForPostfixExpression3:) 
	#(134 1 #reduceActionForBooleanLiteral2:) 
	#(158 0 #reduceActionForInitialiseropt1:) 
	#(154 1 #reduceActionForElementList1:) 
	#(176 2 #reduceActionForSourceElements2:) 
	#(139 2 #reduceActionForExpressionStatement1:) 
	#(92 3 #reduceActionForArrayLiteral1:) 
	#(186 3 #reduceActionForObjectLiteral2:) 
	#(136 3 #reduceActionForBlock1:) 
	#(152 2 #reduceActionForSourceElements2:) 
	#(94 3 #reduceActionForPrimaryExpression6:) 
	#(106 3 #reduceActionForMemberExpression5:) 
	#(144 3 #reduceActionForReturnStatement1:) 
	#(143 3 #reduceActionForBreakStatement1:) 
	#(142 3 #reduceActionForContinueStatement1:) 
	#(172 0 #reduceActionForFormalParameterListopt1:) 
	#(148 3 #reduceActionForThrowStatement1:) 
	#(149 3 #reduceActionForTryStatement1:) 
	#(149 3 #reduceActionForTryStatement2:) 
	#(118 1 #reduceActionForBooleanLiteral2:) 
	#(120 1 #reduceActionForBooleanLiteral2:) 
	#(122 1 #reduceActionForBooleanLiteral2:) 
	#(124 1 #reduceActionForBooleanLiteral2:) 
	#(126 1 #reduceActionForBooleanLiteral2:) 
	#(128 1 #reduceActionForBooleanLiteral2:) 
	#(130 1 #reduceActionForBooleanLiteral2:) 
	#(133 1 #reduceActionForBooleanLiteral2:) 
	#(184 1 #reduceActionForBooleanLiteral2:) 
	#(132 1 #reduceActionForBooleanLiteral2:) 
	#(162 1 #reduceActionForBooleanLiteral2:) 
	#(146 3 #reduceActionForLabelledStatement1:) 
	#(107 2 #reduceActionForArguments1:) 
	#(110 1 #reduceActionForElementList1:) 
	#(106 3 #reduceActionForMemberExpression4:) 
	#(109 3 #reduceActionForMemberExpression4:) 
	#(97 3 #reduceActionForAssignmentExpression2:) 
	#(114 3 #reduceActionForMultiplicativeExpression4:) 
	#(115 3 #reduceActionForMultiplicativeExpression4:) 
	#(116 3 #reduceActionForMultiplicativeExpression4:) 
	#(117 3 #reduceActionForMultiplicativeExpression4:) 
	#(119 3 #reduceActionForMultiplicativeExpression4:) 
	#(121 3 #reduceActionForMultiplicativeExpression4:) 
	#(123 3 #reduceActionForMultiplicativeExpression4:) 
	#(125 3 #reduceActionForMultiplicativeExpression4:) 
	#(127 3 #reduceActionForMultiplicativeExpression4:) 
	#(129 3 #reduceActionForMultiplicativeExpression4:) 
	#(155 2 #reduceActionForVariableDeclaration1:) 
	#(158 1 #reduceActionForSourceElementsopt2:) 
	#(137 3 #reduceActionForVariableStatement1:) 
	#(185 3 #reduceActionForExpression2:) 
	#(95 3 #reduceActionForElementList2:) 
	#(186 4 #reduceActionForObjectLiteral3:) 
	#(98 3 #reduceActionForElementList2:) 
	#(99 3 #reduceActionForPropertyAssignment1:) 
	#(173 1 #reduceActionForElementList1:) 
	#(172 1 #reduceActionForSourceElementsopt2:) 
	#(171 2 #reduceActionForFinally1:) 
	#(149 4 #reduceActionForTryStatement3:) 
	#(159 0 #reduceActionForInitialiseropt1:) 
	#(157 1 #reduceActionForElementList1:) 
	#(106 4 #reduceActionForMemberExpression3:) 
	#(107 3 #reduceActionForArguments2:) 
	#(109 4 #reduceActionForMemberExpression3:) 
	#(160 2 #reduceActionForFinally1:) 
	#(154 3 #reduceActionForElementList2:) 
	#(102 1 #reduceActionForBooleanLiteral2:) 
	#(145 5 #reduceActionForWithStatement1:) 
	#(166 0 #reduceActionForSourceElementsopt1:) 
	#(147 5 #reduceActionForSwitchStatement1:) 
	#(141 5 #reduceActionForIterationStatement2:) 
	#(132 3 #reduceActionForAssignmentExpression2:) 
	#(118 3 #reduceActionForMultiplicativeExpression4:) 
	#(120 3 #reduceActionForMultiplicativeExpression4:) 
	#(122 3 #reduceActionForMultiplicativeExpression4:) 
	#(124 3 #reduceActionForMultiplicativeExpression4:) 
	#(126 3 #reduceActionForMultiplicativeExpression4:) 
	#(128 3 #reduceActionForMultiplicativeExpression4:) 
	#(130 3 #reduceActionForMultiplicativeExpression4:) 
	#(156 2 #reduceActionForVariableDeclaration1:) 
	#(159 1 #reduceActionForSourceElementsopt2:) 
	#(184 3 #reduceActionForExpression2:) 
	#(140 5 #reduceActionForIfStatement2:) 
	#(110 3 #reduceActionForElementList2:) 
	#(131 5 #reduceActionForConditionalExpression2:) 
	#(169 1 #reduceActionForSourceElements1:) 
	#(166 1 #reduceActionForSourceElementsopt2:) 
	#(173 3 #reduceActionForElementList2:) 
	#(161 2 #reduceActionForFinally1:) 
	#(157 3 #reduceActionForElementList2:) 
	#(101 1 #reduceActionForSourceElementsopt2:) 
	#(165 3 #reduceActionForCaseBlock1:) 
	#(169 2 #reduceActionForSourceElements2:) 
	#(170 5 #reduceActionForCatch1:) 
	#(141 7 #reduceActionForIterationStatement1:) 
	#(141 7 #reduceActionForIterationStatement5:) 
	#(141 7 #reduceActionForIterationStatement7:) 
	#(133 5 #reduceActionForConditionalExpression2:) 
	#(140 7 #reduceActionForIfStatement1:) 
	#(99 7 #reduceActionForPropertyAssignment2:) 
	#(105 8 #reduceActionForFunctionExpression1:) 
	#(141 8 #reduceActionForIterationStatement6:) 
	#(141 8 #reduceActionForIterationStatement8:) 
	#(99 8 #reduceActionForPropertyAssignment3:) 
	#(168 4 #reduceActionForCaseClause1:) 
	#(167 3 #reduceActionForDefaultClause1:) 
	#(165 5 #reduceActionForCaseBlock2:) 
	#(141 9 #reduceActionForIterationStatement3:) 
	#(141 10 #reduceActionForIterationStatement4:)
	).
]

{ #category : #generated }
JSParser >> symbolNames [
	^ #('"<<"' '">>"' '"%"' '"*"' '">>>"' '"-"' '"~"' '">"' '"<"' '"!"' '"!="' '"false"' '"=="' '"in"' '"!=="' '"<="' '">="' '"+"' '"typeof"' '"instanceof"' '"]"' '","' '"["' '")"' '"{"' '"else"' '"this"' '":"' '"}"' '"("' '"--"' '"delete"' '"++"' '"new"' '"void"' '"get"' '"set"' '"==="' '"&"' '"."' '"return"' '"with"' '"break"' '"continue"' '"switch"' '"while"' '"^"' '"default"' '"case"' '"of"' '"function"' '"null"' '"debugger"' '"finally"' '"true"' '"throw"' '"try"' '"do"' '"for"' '"catch"' '"*="' '"if"' '"="' '"?"' '"+="' '"|"' '"&&"' '"%="' '"-="' '"||"' '"var"' '"<<="' '"|="' '"const"' '"let"' '">>="' '">>>="' '"^="' '"&="' '<semicolon>' '<slash>' '<slashEqual>' '<comment>' '<identifier>' '<identifierName>' '<whitespace>' '<string>' '<numeric>' '<regular_expression>' '<patternToken>' 'Literal' 'ArrayLiteral' 'Statement' 'PrimaryExpression' 'ElementList' 'ElementExpression' 'AssignmentExpression' 'PropertyNameAndValueList' 'PropertyAssignment' 'PropertyName' 'FunctionBody' 'PropertySetParameterList' 'StringLiteral' 'NumericLiteral' 'FunctionExpression' 'MemberExpression' 'Arguments' 'NewExpression' 'CallExpression' 'ArgumentList' 'LeftHandSideExpression' 'PostfixExpression' 'UnaryExpression' 'MultiplicativeExpression' 'AdditiveExpression' 'ShiftExpression' 'RelationalExpression' 'RelationalExpressionNoIn' 'EqualityExpression' 'EqualityExpressionNoIn' 'BitwiseANDExpression' 'BitwiseANDExpressionNoIn' 'BitwiseXORExpression' 'BitwiseXORExpressionNoIn' 'BitwiseORExpression' 'BitwiseORExpressionNoIn' 'LogicalANDExpression' 'LogicalANDExpressionNoIn' 'LogicalORExpression' 'LogicalORExpressionNoIn' 'ConditionalExpression' 'AssignmentExpressionNoIn' 'ConditionalExpressionNoIn' 'AssignmentOperator' 'B e g i n' 'Block' 'VariableStatement' 'EmptyStatement' 'ExpressionStatement' 'IfStatement' 'IterationStatement' 'ContinueStatement' 'BreakStatement' 'ReturnStatement' 'WithStatement' 'LabelledStatement' 'SwitchStatement' 'ThrowStatement' 'TryStatement' 'DebuggerStatement' 'StatementListopt' 'StatementList' 'VarType' 'VariableDeclarationList' 'VariableDeclaration' 'VariableDeclarationNoIn' 'VariableDeclarationListNoIn' 'Initialiseropt' 'InitialiserNoInopt' 'Initialiser' 'InitialiserNoIn' 'ExpressionNoInopt' 'Expressionopt' 'Identifieropt' 'CaseBlock' 'CaseClausesopt' 'DefaultClause' 'CaseClause' 'CaseClauses' 'Catch' 'Finally' 'FormalParameterListopt' 'FormalParameterList' 'SourceElementsopt' 'SourceElement' 'SourceElements' 'NullLiteral' 'BooleanLiteral' 'RegularExpressionLiteral' 'goal' 'Program' 'E O F' 'error' 'ExpressionNoIn' 'Expression' 'ObjectLiteral')
]

{ #category : #generated }
JSParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JSLiteralNode #JSArrayLiteralNode #JSStatementNode #JSExpressionNode #OrderedCollection #JSExpressionNode #JSExpressionNode #OrderedCollection #JSProgramNode #JSNameExpressionNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #JSFunctionNode #JSExpressionNode #OrderedCollection #JSExpressionNode #JSExpressionNode #OrderedCollection #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #SmaCCToken #JSFileNode #JSBlockStatementNode #JSVariableStatementNode #JSEmptyStatementNode #JSExpressionStatementNode #JSIfStatementNode #JSStatementNode #JSContinueStatementNode #JSBreakStatementNode #JSReturnStatementNode #JSWithStatementNode #JSLabelledStatementNode #JSSwitchStatementNode #JSThrowStatementNode #JSTryStatementNode #JSDebuggerStatementNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #JSVariableDeclarationNode #JSVariableDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode #SmaCCToken #OrderedCollection #OrderedCollection #JSDefaultClauseNode #JSCaseClauseNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSStatementNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #JSFileNode #JSFileNode #SmaCCToken #SmaCCToken #JSExpressionNode #JSExpressionNode #JSObjectLiteralNode)
]

{ #category : #generated }
JSParser >> transitionTable [
^#(
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 81 0 174 1 85 0 175 1 89 0 176 1 93 0 177 1 97 0 178 1 101 0 179 1 105 0 180 1 109 0 181 0 6 0 182 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 129 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 1 133 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 81 0 174 1 85 0 175 1 89 0 176 1 93 0 177 1 97 0 178 1 101 0 179 1 137 0 181 0 6 0 182 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 145 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 149 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 153 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 0 10 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 157 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 161 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 14 0 21 0 14 0 22 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 1 165 0 95 1 169 0 96 1 173 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 7 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 1 181 0 36 1 185 0 37 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 1 189 0 85 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 1 193 0 93 0 185 0 94 0 189 0 97 1 197 0 98 1 201 0 99 1 205 0 100 1 209 0 103 1 213 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 217 0 151 1 221 0 152 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 0 22 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 225 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 229 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 233 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 237 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 33 0 12 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 73 0 34 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 1 241 0 106 1 245 0 108 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 1 249 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 0 26 0 80 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 253 0 163 1 93 0 177 1 97 0 178 1 101 0 179 2 1 0 185 1 117 0 186] 
#[0 2 5 0 30] 
#[1 0 30 0 80 2 9 0 84 2 13 0 164] 
#[1 0 30 0 80 2 9 0 84 2 17 0 164] 
#[0 2 21 0 30] 
#[0 2 25 0 30] 
#[1 0 30 0 30 2 9 0 84 2 29 0 164] 
#[0 0 34 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 2 33 0 80] 
#[0 0 10 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 2 37 0 185 1 117 0 186] 
#[1 2 41 0 25 2 45 0 136] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 2 49 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 2 53 0 30] 
#[0 2 57 0 30] 
#[0 0 38 0 84] 
#[0 0 38 0 84] 
#[0 0 38 0 84] 
#[0 0 42 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 0 46 0 1 0 46 0 2 0 46 0 3 0 46 0 4 0 46 0 5 0 46 0 6 0 46 0 8 0 46 0 9 0 46 0 11 0 46 0 13 0 46 0 14 0 46 0 15 0 46 0 16 0 46 0 17 0 46 0 18 0 46 0 20 0 46 0 22 0 46 0 23 2 61 0 28 0 46 0 30 0 46 0 31 0 46 0 33 0 46 0 38 0 46 0 39 0 46 0 40 0 46 0 47 0 46 0 61 0 46 0 63 0 46 0 64 0 46 0 65 0 46 0 66 0 46 0 67 0 46 0 68 0 46 0 69 0 46 0 70 0 46 0 72 0 46 0 73 0 46 0 76 0 46 0 77 0 46 0 78 0 46 0 79 0 46 0 80 0 46 0 81 0 46 0 82] 
#[0 0 50 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 58 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 62 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 62 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 66 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 74 0 21 0 22 0 24 0 28 0 80 0 182] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 82 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 86 0 1 0 86 0 2 0 86 0 3 0 86 0 4 0 86 0 5 0 86 0 6 0 86 0 8 0 86 0 9 0 86 0 11 0 86 0 13 0 86 0 14 0 86 0 15 0 86 0 16 0 86 0 17 0 86 0 18 0 86 0 20 0 86 0 21 0 86 0 22 2 65 0 23 0 86 0 24 0 86 0 28 0 86 0 29 2 69 0 30 0 86 0 31 0 86 0 33 0 86 0 38 0 86 0 39 2 73 0 40 0 86 0 47 0 86 0 50 0 86 0 61 0 86 0 63 0 86 0 64 0 86 0 65 0 86 0 66 0 86 0 67 0 86 0 68 0 86 0 69 0 86 0 70 0 86 0 72 0 86 0 73 0 86 0 76 0 86 0 77 0 86 0 78 0 86 0 79 0 86 0 80 0 86 0 81 0 86 0 82 2 77 0 107 0 86 0 182] 
#[0 0 90 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 31 0 33 0 38 0 39 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 90 0 1 0 90 0 2 0 90 0 3 0 90 0 4 0 90 0 5 0 90 0 6 0 90 0 8 0 90 0 9 0 90 0 11 0 90 0 13 0 90 0 14 0 90 0 15 0 90 0 16 0 90 0 17 0 90 0 18 0 90 0 20 0 90 0 21 0 90 0 22 2 81 0 23 0 90 0 24 0 90 0 28 0 90 0 29 2 69 0 30 0 90 0 31 0 90 0 33 0 90 0 38 0 90 0 39 2 85 0 40 0 90 0 47 0 90 0 50 0 90 0 61 0 90 0 63 0 90 0 64 0 90 0 65 0 90 0 66 0 90 0 67 0 90 0 68 0 90 0 69 0 90 0 70 0 90 0 72 0 90 0 73 0 90 0 76 0 90 0 77 0 90 0 78 0 90 0 79 0 90 0 80 0 90 0 81 0 90 0 82 2 89 0 107 0 90 0 182] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 8 0 94 0 9 0 94 0 11 0 94 0 13 0 94 0 14 0 94 0 15 0 94 0 16 0 94 0 17 0 94 0 18 0 94 0 20 0 94 0 21 0 94 0 22 0 94 0 24 0 94 0 28 0 94 0 29 2 93 0 31 2 97 0 33 0 94 0 38 0 94 0 39 0 94 0 47 2 101 0 61 2 105 0 63 0 94 0 64 2 109 0 65 0 94 0 66 0 94 0 67 2 113 0 68 2 117 0 69 0 94 0 70 2 121 0 72 2 125 0 73 2 129 0 76 2 133 0 77 2 137 0 78 2 141 0 79 0 94 0 80 0 94 0 81 2 145 0 82 2 149 0 134 0 94 0 182] 
#[0 0 98 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 102 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[1 0 106 0 1 0 106 0 2 2 153 0 3 2 157 0 4 0 106 0 5 0 106 0 6 0 106 0 8 0 106 0 9 0 106 0 11 0 106 0 13 0 106 0 14 0 106 0 15 0 106 0 16 0 106 0 17 0 106 0 18 0 106 0 20 0 106 0 21 0 106 0 22 0 106 0 24 0 106 0 28 0 106 0 29 0 106 0 38 0 106 0 39 0 106 0 47 0 106 0 50 0 106 0 64 0 106 0 66 0 106 0 67 0 106 0 70 0 106 0 80 2 161 0 81 0 106 0 182] 
#[1 0 110 0 1 0 110 0 2 0 110 0 5 2 165 0 6 0 110 0 8 0 110 0 9 0 110 0 11 0 110 0 13 0 110 0 14 0 110 0 15 0 110 0 16 0 110 0 17 2 169 0 18 0 110 0 20 0 110 0 21 0 110 0 22 0 110 0 24 0 110 0 28 0 110 0 29 0 110 0 38 0 110 0 39 0 110 0 47 0 110 0 50 0 110 0 64 0 110 0 66 0 110 0 67 0 110 0 70 0 110 0 80 0 110 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 0 114 0 8 0 114 0 9 0 114 0 11 0 114 0 13 0 114 0 14 0 114 0 15 0 114 0 16 0 114 0 17 0 114 0 20 0 114 0 21 0 114 0 22 0 114 0 24 0 114 0 28 0 114 0 29 0 114 0 38 0 114 0 39 0 114 0 47 0 114 0 64 0 114 0 66 0 114 0 67 0 114 0 70 0 114 0 80 0 114 0 182] 
#[1 2 185 0 8 2 189 0 9 0 118 0 11 0 118 0 13 2 193 0 14 0 118 0 15 2 197 0 16 2 201 0 17 2 205 0 20 0 118 0 21 0 118 0 22 0 118 0 24 0 118 0 28 0 118 0 29 0 118 0 38 0 118 0 39 0 118 0 47 0 118 0 64 0 118 0 66 0 118 0 67 0 118 0 70 0 118 0 80 0 118 0 182] 
#[1 2 209 0 11 2 213 0 13 2 217 0 15 0 122 0 21 0 122 0 22 0 122 0 24 0 122 0 28 0 122 0 29 2 221 0 38 0 122 0 39 0 122 0 47 0 122 0 64 0 122 0 66 0 122 0 67 0 122 0 70 0 122 0 80 0 122 0 182] 
#[1 0 126 0 21 0 126 0 22 0 126 0 24 0 126 0 28 0 126 0 29 2 225 0 39 0 126 0 47 0 126 0 64 0 126 0 66 0 126 0 67 0 126 0 70 0 126 0 80 0 126 0 182] 
#[1 0 130 0 21 0 130 0 22 0 130 0 24 0 130 0 28 0 130 0 29 2 229 0 47 0 130 0 64 0 130 0 66 0 130 0 67 0 130 0 70 0 130 0 80 0 130 0 182] 
#[1 0 134 0 21 0 134 0 22 0 134 0 24 0 134 0 28 0 134 0 29 0 134 0 64 2 233 0 66 0 134 0 67 0 134 0 70 0 134 0 80 0 134 0 182] 
#[1 0 138 0 21 0 138 0 22 0 138 0 24 0 138 0 28 0 138 0 29 0 138 0 64 2 237 0 67 0 138 0 70 0 138 0 80 0 138 0 182] 
#[1 0 142 0 21 0 142 0 22 0 142 0 24 0 142 0 28 0 142 0 29 2 241 0 64 2 245 0 70 0 142 0 80 0 142 0 182] 
#[0 0 146 0 21 0 22 0 24 0 28 0 29 0 80 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 2 249 0 84 2 253 0 154 3 1 0 155] 
#[0 0 154 0 182] 
#[0 0 158 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 162 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 3 5 0 175 1 93 0 177 1 97 0 178 1 101 0 179 0 162 0 182 1 113 0 185 1 117 0 186] 
#[0 0 166 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 170 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 174 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 0 0 182] 
#[0 0 178 0 182] 
#[1 3 9 0 22 3 13 0 80] 
#[0 0 62 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 1 177 0 29 1 181 0 36 1 185 0 37 1 189 0 85 0 161 0 87 0 165 0 88 1 197 0 98 1 201 0 99 1 205 0 100 3 17 0 103 3 21 0 104] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 3 9 0 22 0 0 0 182] 
#[0 0 0 0 182] 
#[0 0 0 0 182] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 8 0 94 0 9 0 94 0 11 0 94 0 13 0 94 0 14 0 94 0 15 0 94 0 16 0 94 0 17 0 94 0 18 0 94 0 20 0 94 0 21 0 94 0 22 0 94 0 24 0 94 0 28 0 94 0 29 2 93 0 31 2 97 0 33 0 94 0 38 0 94 0 39 0 94 0 47 0 94 0 50 0 94 0 64 0 94 0 66 0 94 0 67 0 94 0 70 0 94 0 80 0 94 0 81 0 94 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[1 3 25 0 21 3 29 0 22] 
#[0 0 186 0 21 0 22] 
#[0 0 190 0 21 0 22] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 1 189 0 85 0 161 0 87 0 165 0 88 3 33 0 100 3 17 0 103 3 21 0 104] 
#[1 1 189 0 85 0 161 0 87 0 165 0 88 3 37 0 100 3 17 0 103 3 21 0 104] 
#[0 0 198 0 28 0 30] 
#[0 0 202 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89] 
#[1 3 41 0 22 3 45 0 29] 
#[0 0 206 0 22 0 29] 
#[0 3 49 0 28] 
#[1 0 78 0 1 0 78 0 2 0 78 0 3 0 78 0 4 0 78 0 5 0 78 0 6 0 78 0 8 0 78 0 9 0 78 0 11 0 78 0 13 0 78 0 14 0 78 0 15 0 78 0 16 0 78 0 17 0 78 0 18 0 78 0 20 0 78 0 22 0 78 0 23 0 198 0 28 0 78 0 30 0 78 0 31 0 78 0 33 0 78 0 38 0 78 0 39 0 78 0 40 0 78 0 47 0 78 0 61 0 78 0 63 0 78 0 64 0 78 0 65 0 78 0 66 0 78 0 67 0 78 0 68 0 78 0 69 0 78 0 70 0 78 0 72 0 78 0 73 0 78 0 76 0 78 0 77 0 78 0 78 0 78 0 79 0 78 0 80 0 78 0 81 0 78 0 82] 
#[1 0 82 0 1 0 82 0 2 0 82 0 3 0 82 0 4 0 82 0 5 0 82 0 6 0 82 0 8 0 82 0 9 0 82 0 11 0 82 0 13 0 82 0 14 0 82 0 15 0 82 0 16 0 82 0 17 0 82 0 18 0 82 0 20 0 82 0 22 0 82 0 23 0 198 0 28 0 82 0 30 0 82 0 31 0 82 0 33 0 82 0 38 0 82 0 39 0 82 0 40 0 82 0 47 0 82 0 61 0 82 0 63 0 82 0 64 0 82 0 65 0 82 0 66 0 82 0 67 0 82 0 68 0 82 0 69 0 82 0 70 0 82 0 72 0 82 0 73 0 82 0 76 0 82 0 77 0 82 0 78 0 82 0 79 0 82 0 80 0 82 0 81 0 82 0 82] 
#[0 3 53 0 29] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 210 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 210 0 48 0 210 0 49 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 3 57 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 3 9 0 22 3 61 0 24] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[1 0 86 0 1 0 86 0 2 0 86 0 3 0 86 0 4 0 86 0 5 0 86 0 6 0 86 0 8 0 86 0 9 0 86 0 11 0 86 0 13 0 86 0 14 0 86 0 15 0 86 0 16 0 86 0 17 0 86 0 18 0 86 0 20 0 86 0 21 0 86 0 22 2 65 0 23 0 86 0 24 0 86 0 28 0 86 0 29 2 69 0 30 0 86 0 31 0 86 0 33 0 86 0 38 0 86 0 39 2 73 0 40 0 86 0 47 0 86 0 50 0 86 0 61 0 86 0 63 0 86 0 64 0 86 0 65 0 86 0 66 0 86 0 67 0 86 0 68 0 86 0 69 0 86 0 70 0 86 0 72 0 86 0 73 0 86 0 76 0 86 0 77 0 86 0 78 0 86 0 79 0 86 0 80 0 86 0 81 0 86 0 82 3 65 0 107 0 86 0 182] 
#[0 0 214 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 31 0 33 0 38 0 39 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 3 69 0 80] 
#[1 3 9 0 22 0 218 0 24 0 218 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 73 0 185 1 117 0 186] 
#[0 0 222 0 30 0 80] 
#[0 3 77 0 80] 
#[0 3 81 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 85 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 89 0 185 1 117 0 186] 
#[0 3 93 0 30] 
#[0 0 226 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 3 9 0 22 3 97 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 18 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 1 193 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 217 0 151 1 221 0 152 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 3 101 0 54 3 105 0 60 3 109 0 170 3 113 0 171] 
#[0 3 117 0 46] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 0 141 0 71 0 145 0 74 0 149 0 75 0 230 0 80 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 3 121 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 3 157 0 132 3 161 0 133 3 165 0 153 3 169 0 162 1 93 0 177 1 97 0 178 1 101 0 179 3 173 0 184 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 177 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 3 181 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 185 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 3 189 0 24 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 3 193 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 3 197 0 110 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 3 201 0 85] 
#[0 0 234 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 3 205 0 185 1 117 0 186] 
#[0 3 209 0 85] 
#[0 0 234 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 0 238 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 238 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[0 0 242 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 30 0 31 0 32 0 33 0 34 0 35 0 51 0 52 0 55 0 84 0 87 0 88 0 89] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 3 213 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 3 217 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 3 221 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 3 225 0 113 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 3 229 0 114 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 3 233 0 114 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 3 237 0 115 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 3 241 0 115 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 3 245 0 115 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 249 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 253 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 4 1 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 4 5 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 4 9 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 4 13 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 4 17 0 117 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 4 21 0 117 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 4 25 0 117 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 4 29 0 117 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 4 33 0 119 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 4 37 0 121 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 4 41 0 123 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 4 45 0 125 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 4 49 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 4 53 0 127 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 246 0 22 4 57 0 63 0 246 0 80 4 61 0 158 4 65 0 160] 
#[1 4 69 0 22 4 73 0 80] 
#[0 0 250 0 22 0 80] 
#[0 0 254 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 4 77 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 1 2 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 0 198 0 28 0 30] 
#[0 0 198 0 28 0 30] 
#[0 1 6 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 14 0 21 0 14 0 22 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 4 81 0 96 1 173 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 4 85 0 30] 
#[0 4 89 0 30] 
#[1 4 93 0 29 1 181 0 36 1 185 0 37 1 189 0 85 0 161 0 87 0 165 0 88 4 97 0 99 1 205 0 100 3 17 0 103 3 21 0 104] 
#[0 1 10 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 4 101 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 1 14 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 1 18 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89] 
#[0 1 22 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 26 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 30 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 3 9 0 22 4 105 0 24] 
#[0 1 34 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 1 38 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 3 9 0 22 4 109 0 24] 
#[1 3 9 0 22 4 113 0 24] 
#[1 1 42 0 24 4 117 0 84 4 121 0 172 4 125 0 173] 
#[0 1 46 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 2 41 0 25 4 129 0 136] 
#[0 4 133 0 30] 
#[1 1 50 0 6 1 50 0 7 1 50 0 10 1 50 0 12 1 50 0 18 1 50 0 19 1 50 0 23 1 50 0 25 1 50 0 26 1 50 0 27 1 50 0 29 1 50 0 30 1 50 0 31 1 50 0 32 1 50 0 33 1 50 0 34 1 50 0 35 1 50 0 41 1 50 0 42 1 50 0 43 1 50 0 44 1 50 0 45 1 50 0 46 1 50 0 48 1 50 0 49 1 50 0 51 1 50 0 52 1 50 0 53 3 101 0 54 1 50 0 55 1 50 0 56 1 50 0 57 1 50 0 58 1 50 0 59 1 50 0 62 1 50 0 71 1 50 0 74 1 50 0 75 1 50 0 80 1 50 0 84 1 50 0 87 1 50 0 88 1 50 0 89 4 137 0 171 1 50 0 182] 
#[0 1 54 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 4 141 0 30] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 8 0 94 0 9 0 94 0 11 0 94 0 13 4 145 0 14 0 94 0 15 0 94 0 16 0 94 0 17 0 94 0 18 0 94 0 20 0 94 0 22 2 93 0 31 2 97 0 33 0 94 0 38 0 94 0 39 0 94 0 47 4 149 0 50 2 101 0 61 2 105 0 63 0 94 0 64 2 109 0 65 0 94 0 66 0 94 0 67 2 113 0 68 2 117 0 69 0 94 0 70 2 121 0 72 2 125 0 73 2 129 0 76 2 133 0 77 2 137 0 78 2 141 0 79 0 94 0 80 0 94 0 81 2 145 0 82 4 153 0 134] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 58 0 8 1 58 0 9 1 58 0 11 1 58 0 13 1 58 0 14 1 58 0 15 1 58 0 16 1 58 0 17 1 58 0 20 1 58 0 22 1 58 0 28 1 58 0 38 1 58 0 39 1 58 0 47 1 58 0 50 1 58 0 64 1 58 0 66 1 58 0 67 1 58 0 70 1 58 0 80] 
#[1 4 157 0 8 4 161 0 9 1 62 0 11 1 62 0 13 1 62 0 14 1 62 0 15 4 165 0 16 4 169 0 17 4 173 0 20 1 62 0 22 1 62 0 28 1 62 0 38 1 62 0 39 1 62 0 47 1 62 0 50 1 62 0 64 1 62 0 66 1 62 0 67 1 62 0 70 1 62 0 80] 
#[1 4 177 0 11 4 181 0 13 1 66 0 14 4 185 0 15 1 66 0 22 1 66 0 28 4 189 0 38 1 66 0 39 1 66 0 47 1 66 0 50 1 66 0 64 1 66 0 66 1 66 0 67 1 66 0 70 1 66 0 80] 
#[1 1 70 0 14 1 70 0 22 1 70 0 28 4 193 0 39 1 70 0 47 1 70 0 50 1 70 0 64 1 70 0 66 1 70 0 67 1 70 0 70 1 70 0 80] 
#[1 1 74 0 14 1 74 0 22 1 74 0 28 4 197 0 47 1 74 0 50 1 74 0 64 1 74 0 66 1 74 0 67 1 74 0 70 1 74 0 80] 
#[1 1 78 0 14 1 78 0 22 1 78 0 28 1 78 0 50 1 78 0 64 4 201 0 66 1 78 0 67 1 78 0 70 1 78 0 80] 
#[1 1 82 0 14 1 82 0 22 1 82 0 28 1 82 0 50 1 82 0 64 4 205 0 67 1 82 0 70 1 82 0 80] 
#[1 1 86 0 14 1 86 0 22 1 86 0 28 1 86 0 50 4 209 0 64 4 213 0 70 1 86 0 80] 
#[0 1 90 0 22 0 80] 
#[0 1 94 0 14 0 22 0 28 0 50 0 80] 
#[1 4 217 0 84 4 221 0 156 4 225 0 157] 
#[0 4 229 0 80] 
#[1 4 233 0 22 1 98 0 80] 
#[1 3 9 0 22 4 237 0 24] 
#[0 1 102 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 4 241 0 21 3 9 0 22] 
#[0 1 106 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 110 0 22 0 24] 
#[1 4 245 0 22 4 249 0 24] 
#[0 1 114 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 4 253 0 21 3 9 0 22] 
#[0 1 118 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 122 0 21 0 22 0 24 0 28 0 29 0 80 0 182] 
#[0 1 126 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 1 126 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[0 1 126 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 24 0 28 0 29 0 38 0 39 0 47 0 50 0 64 0 66 0 67 0 70 0 80 0 81 0 182] 
#[1 1 130 0 1 1 130 0 2 2 153 0 3 2 157 0 4 1 130 0 5 1 130 0 6 1 130 0 8 1 130 0 9 1 130 0 11 1 130 0 13 1 130 0 14 1 130 0 15 1 130 0 16 1 130 0 17 1 130 0 18 1 130 0 20 1 130 0 21 1 130 0 22 1 130 0 24 1 130 0 28 1 130 0 29 1 130 0 38 1 130 0 39 1 130 0 47 1 130 0 50 1 130 0 64 1 130 0 66 1 130 0 67 1 130 0 70 1 130 0 80 2 161 0 81 1 130 0 182] 
#[1 1 130 0 1 1 130 0 2 2 153 0 3 2 157 0 4 1 130 0 5 1 130 0 6 1 130 0 8 1 130 0 9 1 130 0 11 1 130 0 13 1 130 0 14 1 130 0 15 1 130 0 16 1 130 0 17 1 130 0 18 1 130 0 20 1 130 0 21 1 130 0 22 1 130 0 24 1 130 0 28 1 130 0 29 1 130 0 38 1 130 0 39 1 130 0 47 1 130 0 50 1 130 0 64 1 130 0 66 1 130 0 67 1 130 0 70 1 130 0 80 2 161 0 81 1 130 0 182] 
#[1 1 134 0 1 1 134 0 2 1 134 0 5 2 165 0 6 1 134 0 8 1 134 0 9 1 134 0 11 1 134 0 13 1 134 0 14 1 134 0 15 1 134 0 16 1 134 0 17 2 169 0 18 1 134 0 20 1 134 0 21 1 134 0 22 1 134 0 24 1 134 0 28 1 134 0 29 1 134 0 38 1 134 0 39 1 134 0 47 1 134 0 50 1 134 0 64 1 134 0 66 1 134 0 67 1 134 0 70 1 134 0 80 1 134 0 182] 
#[1 1 134 0 1 1 134 0 2 1 134 0 5 2 165 0 6 1 134 0 8 1 134 0 9 1 134 0 11 1 134 0 13 1 134 0 14 1 134 0 15 1 134 0 16 1 134 0 17 2 169 0 18 1 134 0 20 1 134 0 21 1 134 0 22 1 134 0 24 1 134 0 28 1 134 0 29 1 134 0 38 1 134 0 39 1 134 0 47 1 134 0 50 1 134 0 64 1 134 0 66 1 134 0 67 1 134 0 70 1 134 0 80 1 134 0 182] 
#[1 1 134 0 1 1 134 0 2 1 134 0 5 2 165 0 6 1 134 0 8 1 134 0 9 1 134 0 11 1 134 0 13 1 134 0 14 1 134 0 15 1 134 0 16 1 134 0 17 2 169 0 18 1 134 0 20 1 134 0 21 1 134 0 22 1 134 0 24 1 134 0 28 1 134 0 29 1 134 0 38 1 134 0 39 1 134 0 47 1 134 0 50 1 134 0 64 1 134 0 66 1 134 0 67 1 134 0 70 1 134 0 80 1 134 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 1 138 0 8 1 138 0 9 1 138 0 11 1 138 0 13 1 138 0 14 1 138 0 15 1 138 0 16 1 138 0 17 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 28 1 138 0 29 1 138 0 38 1 138 0 39 1 138 0 47 1 138 0 64 1 138 0 66 1 138 0 67 1 138 0 70 1 138 0 80 1 138 0 182] 
#[1 2 185 0 8 2 189 0 9 1 142 0 11 1 142 0 13 2 193 0 14 1 142 0 15 2 197 0 16 2 201 0 17 2 205 0 20 1 142 0 21 1 142 0 22 1 142 0 24 1 142 0 28 1 142 0 29 1 142 0 38 1 142 0 39 1 142 0 47 1 142 0 64 1 142 0 66 1 142 0 67 1 142 0 70 1 142 0 80 1 142 0 182] 
#[1 2 185 0 8 2 189 0 9 1 142 0 11 1 142 0 13 2 193 0 14 1 142 0 15 2 197 0 16 2 201 0 17 2 205 0 20 1 142 0 21 1 142 0 22 1 142 0 24 1 142 0 28 1 142 0 29 1 142 0 38 1 142 0 39 1 142 0 47 1 142 0 64 1 142 0 66 1 142 0 67 1 142 0 70 1 142 0 80 1 142 0 182] 
#[1 2 185 0 8 2 189 0 9 1 142 0 11 1 142 0 13 2 193 0 14 1 142 0 15 2 197 0 16 2 201 0 17 2 205 0 20 1 142 0 21 1 142 0 22 1 142 0 24 1 142 0 28 1 142 0 29 1 142 0 38 1 142 0 39 1 142 0 47 1 142 0 64 1 142 0 66 1 142 0 67 1 142 0 70 1 142 0 80 1 142 0 182] 
#[1 2 185 0 8 2 189 0 9 1 142 0 11 1 142 0 13 2 193 0 14 1 142 0 15 2 197 0 16 2 201 0 17 2 205 0 20 1 142 0 21 1 142 0 22 1 142 0 24 1 142 0 28 1 142 0 29 1 142 0 38 1 142 0 39 1 142 0 47 1 142 0 64 1 142 0 66 1 142 0 67 1 142 0 70 1 142 0 80 1 142 0 182] 
#[1 2 209 0 11 2 213 0 13 2 217 0 15 1 146 0 21 1 146 0 22 1 146 0 24 1 146 0 28 1 146 0 29 2 221 0 38 1 146 0 39 1 146 0 47 1 146 0 64 1 146 0 66 1 146 0 67 1 146 0 70 1 146 0 80 1 146 0 182] 
#[1 1 150 0 21 1 150 0 22 1 150 0 24 1 150 0 28 1 150 0 29 2 225 0 39 1 150 0 47 1 150 0 64 1 150 0 66 1 150 0 67 1 150 0 70 1 150 0 80 1 150 0 182] 
#[1 1 154 0 21 1 154 0 22 1 154 0 24 1 154 0 28 1 154 0 29 2 229 0 47 1 154 0 64 1 154 0 66 1 154 0 67 1 154 0 70 1 154 0 80 1 154 0 182] 
#[1 1 158 0 21 1 158 0 22 1 158 0 24 1 158 0 28 1 158 0 29 1 158 0 64 2 233 0 66 1 158 0 67 1 158 0 70 1 158 0 80 1 158 0 182] 
#[0 5 1 0 28] 
#[1 1 162 0 21 1 162 0 22 1 162 0 24 1 162 0 28 1 162 0 29 1 162 0 64 2 237 0 67 1 162 0 70 1 162 0 80 1 162 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 5 5 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 1 166 0 22 0 80] 
#[0 1 170 0 22 0 80] 
#[1 2 249 0 84 5 9 0 155] 
#[0 1 174 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 1 178 0 21 0 22 0 24 0 28 0 80 0 182] 
#[0 1 182 0 21 0 22] 
#[0 5 13 0 24] 
#[1 5 17 0 84 5 21 0 102] 
#[0 1 186 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 190 0 22 0 29] 
#[0 1 194 0 22 0 29] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 5 25 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 5 29 0 25 5 33 0 165] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 5 37 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 1 198 0 22 0 24] 
#[0 5 41 0 24] 
#[1 5 45 0 22 1 202 0 24] 
#[0 1 206 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 5 49 0 84] 
#[0 1 210 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 5 53 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 5 57 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 5 61 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 5 65 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 5 69 0 132 3 161 0 133 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 5 73 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 5 77 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 5 81 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 5 85 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 5 89 0 116 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 5 93 0 118 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 5 97 0 118 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 5 101 0 118 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 5 105 0 118 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 5 109 0 120 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 5 113 0 122 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 5 117 0 124 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 5 121 0 126 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 5 65 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 5 125 0 132 3 161 0 133 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 1 141 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 5 129 0 128 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 1 214 0 14 1 214 0 22 1 214 0 50 5 133 0 63 1 214 0 80 5 137 0 159 5 141 0 161] 
#[1 5 145 0 14 1 218 0 22 5 149 0 50 1 218 0 80] 
#[1 5 153 0 22 5 157 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 0 26 0 80 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 5 161 0 163 1 93 0 177 1 97 0 178 1 101 0 179 2 1 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 5 65 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 5 165 0 132 3 161 0 133 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 5 169 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 1 222 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 5 173 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 1 226 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 1 230 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 5 177 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 1 234 0 22 0 80] 
#[0 1 238 0 22 0 80] 
#[0 5 181 0 25] 
#[0 1 242 0 24] 
#[0 5 185 0 24] 
#[0 1 246 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 1 250 0 29 1 250 0 48 5 189 0 49 5 193 0 166 5 197 0 168 5 201 0 169] 
#[0 1 254 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 2 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 5 205 0 25] 
#[0 5 209 0 84] 
#[0 5 213 0 24] 
#[1 3 9 0 22 5 217 0 24] 
#[1 3 9 0 22 5 221 0 24] 
#[1 3 9 0 22 5 225 0 24] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 8 0 94 0 9 0 94 0 11 0 94 0 13 0 94 0 14 0 94 0 15 0 94 0 16 0 94 0 17 0 94 0 18 0 94 0 20 0 94 0 22 0 94 0 28 2 93 0 31 2 97 0 33 0 94 0 38 0 94 0 39 0 94 0 47 0 94 0 50 2 101 0 61 2 105 0 63 0 94 0 64 2 109 0 65 0 94 0 66 0 94 0 67 2 113 0 68 2 117 0 69 0 94 0 70 2 121 0 72 2 125 0 73 2 129 0 76 2 133 0 77 2 137 0 78 2 141 0 79 0 94 0 80 0 94 0 81 2 145 0 82 4 153 0 134] 
#[0 2 6 0 14 0 22 0 28 0 50 0 80] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 2 10 0 8 2 10 0 9 2 10 0 11 2 10 0 13 2 10 0 14 2 10 0 15 2 10 0 16 2 10 0 17 2 10 0 20 2 10 0 22 2 10 0 28 2 10 0 38 2 10 0 39 2 10 0 47 2 10 0 50 2 10 0 64 2 10 0 66 2 10 0 67 2 10 0 70 2 10 0 80] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 2 10 0 8 2 10 0 9 2 10 0 11 2 10 0 13 2 10 0 14 2 10 0 15 2 10 0 16 2 10 0 17 2 10 0 20 2 10 0 22 2 10 0 28 2 10 0 38 2 10 0 39 2 10 0 47 2 10 0 50 2 10 0 64 2 10 0 66 2 10 0 67 2 10 0 70 2 10 0 80] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 2 10 0 8 2 10 0 9 2 10 0 11 2 10 0 13 2 10 0 14 2 10 0 15 2 10 0 16 2 10 0 17 2 10 0 20 2 10 0 22 2 10 0 28 2 10 0 38 2 10 0 39 2 10 0 47 2 10 0 50 2 10 0 64 2 10 0 66 2 10 0 67 2 10 0 70 2 10 0 80] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 2 10 0 8 2 10 0 9 2 10 0 11 2 10 0 13 2 10 0 14 2 10 0 15 2 10 0 16 2 10 0 17 2 10 0 20 2 10 0 22 2 10 0 28 2 10 0 38 2 10 0 39 2 10 0 47 2 10 0 50 2 10 0 64 2 10 0 66 2 10 0 67 2 10 0 70 2 10 0 80] 
#[1 2 173 0 1 2 177 0 2 2 181 0 5 2 10 0 8 2 10 0 9 2 10 0 11 2 10 0 13 2 10 0 14 2 10 0 15 2 10 0 16 2 10 0 17 2 10 0 20 2 10 0 22 2 10 0 28 2 10 0 38 2 10 0 39 2 10 0 47 2 10 0 50 2 10 0 64 2 10 0 66 2 10 0 67 2 10 0 70 2 10 0 80] 
#[1 4 157 0 8 4 161 0 9 2 14 0 11 2 14 0 13 2 14 0 14 2 14 0 15 4 165 0 16 4 169 0 17 4 173 0 20 2 14 0 22 2 14 0 28 2 14 0 38 2 14 0 39 2 14 0 47 2 14 0 50 2 14 0 64 2 14 0 66 2 14 0 67 2 14 0 70 2 14 0 80] 
#[1 4 157 0 8 4 161 0 9 2 14 0 11 2 14 0 13 2 14 0 14 2 14 0 15 4 165 0 16 4 169 0 17 4 173 0 20 2 14 0 22 2 14 0 28 2 14 0 38 2 14 0 39 2 14 0 47 2 14 0 50 2 14 0 64 2 14 0 66 2 14 0 67 2 14 0 70 2 14 0 80] 
#[1 4 157 0 8 4 161 0 9 2 14 0 11 2 14 0 13 2 14 0 14 2 14 0 15 4 165 0 16 4 169 0 17 4 173 0 20 2 14 0 22 2 14 0 28 2 14 0 38 2 14 0 39 2 14 0 47 2 14 0 50 2 14 0 64 2 14 0 66 2 14 0 67 2 14 0 70 2 14 0 80] 
#[1 4 157 0 8 4 161 0 9 2 14 0 11 2 14 0 13 2 14 0 14 2 14 0 15 4 165 0 16 4 169 0 17 4 173 0 20 2 14 0 22 2 14 0 28 2 14 0 38 2 14 0 39 2 14 0 47 2 14 0 50 2 14 0 64 2 14 0 66 2 14 0 67 2 14 0 70 2 14 0 80] 
#[1 4 177 0 11 4 181 0 13 2 18 0 14 4 185 0 15 2 18 0 22 2 18 0 28 4 189 0 38 2 18 0 39 2 18 0 47 2 18 0 50 2 18 0 64 2 18 0 66 2 18 0 67 2 18 0 70 2 18 0 80] 
#[1 2 22 0 14 2 22 0 22 2 22 0 28 4 193 0 39 2 22 0 47 2 22 0 50 2 22 0 64 2 22 0 66 2 22 0 67 2 22 0 70 2 22 0 80] 
#[1 2 26 0 14 2 26 0 22 2 26 0 28 4 197 0 47 2 26 0 50 2 26 0 64 2 26 0 66 2 26 0 67 2 26 0 70 2 26 0 80] 
#[1 2 30 0 14 2 30 0 22 2 30 0 28 2 30 0 50 2 30 0 64 4 201 0 66 2 30 0 67 2 30 0 70 2 30 0 80] 
#[0 5 229 0 28] 
#[1 2 34 0 14 2 34 0 22 2 34 0 28 2 34 0 50 2 34 0 64 4 205 0 67 2 34 0 70 2 34 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 5 65 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 5 233 0 132 3 161 0 133 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 2 38 0 14 0 22 0 50 0 80] 
#[0 2 42 0 14 0 22 0 50 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 5 237 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 5 241 0 185 1 117 0 186] 
#[1 4 217 0 84 5 245 0 156] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 0 26 0 80 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 5 249 0 163 1 93 0 177 1 97 0 178 1 101 0 179 2 1 0 185 1 117 0 186] 
#[0 5 253 0 80] 
#[0 2 46 0 22 0 80] 
#[1 2 50 0 6 2 50 0 7 2 50 0 10 2 50 0 12 2 50 0 18 2 50 0 19 2 50 0 23 2 50 0 25 6 1 0 26 2 50 0 27 2 50 0 29 2 50 0 30 2 50 0 31 2 50 0 32 2 50 0 33 2 50 0 34 2 50 0 35 2 50 0 41 2 50 0 42 2 50 0 43 2 50 0 44 2 50 0 45 2 50 0 46 2 50 0 48 2 50 0 49 2 50 0 51 2 50 0 52 2 50 0 53 2 50 0 55 2 50 0 56 2 50 0 57 2 50 0 58 2 50 0 59 2 50 0 62 2 50 0 71 2 50 0 74 2 50 0 75 2 50 0 80 2 50 0 84 2 50 0 87 2 50 0 88 2 50 0 89 2 50 0 182] 
#[0 2 54 0 22 0 24] 
#[0 2 58 0 21 0 22 0 24 0 28 0 29 0 80 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 6 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 6 5 0 101 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 6 9 0 174 1 85 0 175 1 89 0 176 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 6 13 0 25] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 93 0 177 1 97 0 178 1 101 0 179 6 17 0 185 1 117 0 186] 
#[1 6 21 0 29 6 25 0 48 6 29 0 167] 
#[0 2 62 0 29 0 48 0 49] 
#[1 2 66 0 29 2 66 0 48 5 189 0 49 6 33 0 168] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 6 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 6 37 0 101 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 6 9 0 174 1 85 0 175 1 89 0 176 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 2 70 0 22 0 24] 
#[1 2 41 0 25 6 41 0 136] 
#[0 6 45 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 49 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 53 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 5 65 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 3 125 0 116 3 129 0 118 3 133 0 120 3 137 0 122 3 141 0 124 3 145 0 126 3 149 0 128 3 153 0 130 6 57 0 132 3 161 0 133 1 93 0 177 1 97 0 178 1 101 0 179 1 117 0 186] 
#[0 2 74 0 14 0 22 0 50 0 80] 
#[1 3 9 0 22 6 61 0 24] 
#[1 3 9 0 22 6 65 0 24] 
#[0 2 78 0 22 0 80] 
#[0 6 69 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 26 0 24 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 6 73 0 163 1 93 0 177 1 97 0 178 1 101 0 179 2 1 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 77 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 6 81 0 29] 
#[0 2 82 0 29] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 6 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 181 0 93 0 185 0 94 0 189 0 97 6 85 0 101 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 6 9 0 174 1 85 0 175 1 89 0 176 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 3 9 0 22 6 89 0 28] 
#[0 2 86 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 6 93 0 28] 
#[1 1 250 0 29 5 189 0 49 6 97 0 166 5 197 0 168 5 201 0 169] 
#[0 2 90 0 29 0 48 0 49] 
#[0 6 101 0 29] 
#[0 2 94 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 98 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 102 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 106 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 110 0 14 0 22 0 28 0 50 0 80] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 105 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 109 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 26 0 24 1 121 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 105 0 51 0 109 0 52 0 117 0 55 1 125 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 6 113 0 163 1 93 0 177 1 97 0 178 1 101 0 179 2 1 0 185 1 117 0 186] 
#[0 6 117 0 24] 
#[0 2 114 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 118 0 22 0 29] 
#[0 6 121 0 29] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 18 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 18 0 48 0 18 0 49 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 1 193 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 6 125 0 151 1 221 0 152 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 18 0 29 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 18 0 49 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 1 193 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 6 129 0 151 1 221 0 152 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 6 133 0 29] 
#[0 2 122 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 11 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 24 0 28 0 29 0 30 0 31 0 33 0 38 0 39 0 40 0 47 0 50 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 182] 
#[0 2 126 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 130 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 6 137 0 24] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 141 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 2 134 0 22 0 29] 
#[0 2 138 0 29 0 48 0 49] 
#[0 2 142 0 29 0 49] 
#[0 2 146 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[1 0 21 0 6 0 25 0 7 0 29 0 10 0 33 0 12 0 37 0 18 0 41 0 19 0 45 0 23 0 49 0 25 0 53 0 27 0 57 0 30 0 61 0 31 0 65 0 32 0 69 0 33 0 73 0 34 0 77 0 35 0 81 0 41 0 85 0 42 0 89 0 43 0 93 0 44 0 97 0 45 0 101 0 46 0 105 0 51 0 109 0 52 0 113 0 53 0 117 0 55 0 121 0 56 0 125 0 57 0 129 0 58 0 133 0 59 0 137 0 62 0 141 0 71 0 145 0 74 0 149 0 75 0 153 0 80 0 157 0 84 0 161 0 87 0 165 0 88 0 169 0 89 0 173 0 91 0 177 0 92 6 145 0 93 0 185 0 94 0 189 0 97 0 193 0 103 0 197 0 104 0 201 0 105 0 205 0 106 0 209 0 108 0 213 0 109 0 217 0 111 0 221 0 112 0 225 0 113 0 229 0 114 0 233 0 115 0 237 0 116 0 241 0 117 0 245 0 119 0 249 0 121 0 253 0 123 1 1 0 125 1 5 0 127 1 9 0 129 1 13 0 131 1 17 0 136 1 21 0 137 1 25 0 138 1 29 0 139 1 33 0 140 1 37 0 141 1 41 0 142 1 45 0 143 1 49 0 144 1 53 0 145 1 57 0 146 1 61 0 147 1 65 0 148 1 69 0 149 1 73 0 150 1 77 0 153 1 93 0 177 1 97 0 178 1 101 0 179 1 113 0 185 1 117 0 186] 
#[0 2 150 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182] 
#[0 2 154 0 6 0 7 0 10 0 12 0 18 0 19 0 23 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 51 0 52 0 53 0 55 0 56 0 57 0 58 0 59 0 62 0 71 0 74 0 75 0 80 0 84 0 87 0 88 0 89 0 182]
	).
]
