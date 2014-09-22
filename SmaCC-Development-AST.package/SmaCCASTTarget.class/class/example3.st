resources
example3
	"Starting point: a simple grammar."
	
	"Directive is: %ast. It should create: ASTProgramNode, ASTNumberNode, ASTNumberNode. 
	ASTProgramNode instance variable should be numbers, with reduction via an OrderedCollection. 
	ASTNumberNode should have as instance variable: number.
		
	Reductions should be:"
	
	^ '<number> : [0-9]+ (\. [0-9]*) ? ;
<whitespace> : \s+;

%ast ;

Program: Number ''number'' ('','' Number ''number'') * ;

Number: <number> ''number'' 	;
'