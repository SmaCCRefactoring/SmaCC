generated
definitionComment
"%root Program;
%prefix JS;
%suffix Node;

%start Expression Statement Program ;

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

%id <semicolon> <identifier> <slash> <slashEqual> <regular_expression>;

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
:	IdentifierName 'name' {{NameExpression}}
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
|	MemberExpression 'expression' ""."" 'periodToken' IdentifierName 'name' {{NamedPropertyExpression}}
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
|	CallExpression 'expression' ""."" 'periodToken' IdentifierName 'name' {{NamedPropertyExpression}}
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
IdentifierName
:	<identifier>
;
StringLiteral
:	<string>
;
NumericLiteral
:	<numeric>
;
RegularExpressionLiteral
:	<regular_expression>
;"