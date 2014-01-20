generated-comments
scannerDefinitionComment

	"<DECIMAL_INTEGER>: 0 | [1-9] [0-9]*	;
<HEX_INTEGER>: 0[xX][0-9a-fA-F]+	;
<OCTAL_INTEGER>: 0[0-7]+	;

<EXPONENT>: [eE] [\-\+]? [0-9]+ 	;
<FLOAT_TYPE>: [fFdD]	;

<ESCAPE_SEQUENCE>: \\ ([btnfr\""\'\\] | ([0-3] [0-7]{0,2} | [4-7][0-7]?))	;

<INTEGER_LITERAL>: (<DECIMAL_INTEGER> | <HEX_INTEGER> | <OCTAL_INTEGER>) [lL]?	;
<FLOATING_POINT_LITERAL>: [0-9]+ \. [0-9]* <EXPONENT>? <FLOAT_TYPE>? | \. [0-9]+ <EXPONENT>? <FLOAT_TYPE>? | [0-9]+ <EXPONENT> <FLOAT_TYPE>? | [0-9]+ <FLOAT_TYPE>	;
<BOOLEAN_LITERAL>: true | false	;
<CHARACTER_LITERAL>: \' ([^\\\'] | <ESCAPE_SEQUENCE> ) \'	;
<STRING_LITERAL>: \"" ([^\\\""] | <ESCAPE_SEQUENCE> )* \""	;
<NULL_LITERAL>: null	;

<IDENTIFIER>: [a-zA-Z_] \w*	;

<eol>: \r | \n | \r\n	;
<whitespace>: \s+	;
<comment>: \/\/ [^\r\n]* <eol>	;
<multipleLineComment>: \/ \* 	;"