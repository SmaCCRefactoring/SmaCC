generated
definitionComment
"%glr;

%left ""+"" ""-"";
%left ""*"" ""/"";
%right ""^"";

%prefix SmaCCRewriteTest;
%suffix Node;
%root Expression;
%ignore_variables leftParen rightParen;

%hierarchy Expression (
	Number
	BinaryExpression
	);

<number>
	: \d+
	;

<whitespace>
	: \s+
	;

<patternToken>
	: \` [^\`]* \`
	;

Expression
	: ""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
	| Expression 'left' ""+"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""-"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""*"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""/"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""^"" 'operator' Expression 'right' {{BinaryExpression}}
	| <number> 'number' {{Number}}
	;"
