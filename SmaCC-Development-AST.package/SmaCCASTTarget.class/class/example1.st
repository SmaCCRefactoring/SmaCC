resources
example1
	"Starting point: a simple grammar."
	
	"Directive is: %ast. It should create: ASTProgramNode, ASTExpressionNode, ASTNumberNode. 
	ASTProgramNode instance variable should be expressions. Expressions should be reduced via an OrderedCollection.
	ASTExpressionNode should have as instance variables: right, left, op, rawNodes. 	ASTNumberNode should have as instance variable: number.
		
	Reductions should be:"
	
	^ '<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%left "+" "-";
%left "*" "/";
%right "^";

%ast ;

Program: Expression *  ''expressions'';

Expression 
	: Expression ''left'' "+" ''op'' Expression ''right''
	| Expression ''left'' "-" ''op'' Expression ''right''
	| Expression ''left'' "*" ''op'' Expression ''right''
	| Expression ''left'' "/" ''op'' Expression ''right''
	| Expression ''left'' "^" ''op'' Expression ''right''
	| "(" Expression ")"
	| Number
	;
Number 
	: <number> ''number''
	;
'