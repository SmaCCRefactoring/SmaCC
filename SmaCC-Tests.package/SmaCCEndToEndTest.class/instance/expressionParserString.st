tests
expressionParserString
	^ '
%left "+" "-" ;
%left "*" "/" ;
%right "^" ;

Expression: Expression ''first'' "+" Expression ''last'' {first + last}
	| Expression "-" Expression {''1'' - ''3''}
	| Expression "*" Expression {''1'' * ''3''}
	| Expression "/" Expression {''1'' / ''3''}
	| Expression "^" Expression {''1'' raisedTo: ''3''} 
	| "(" Expression ")" {''2''}
	| <number> {''1'' value asNumber};'