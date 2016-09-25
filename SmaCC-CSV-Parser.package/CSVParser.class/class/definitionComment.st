generated
definitionComment
"%prefix CSV;
%suffix Node;

%root Parse;


<entry> 
	: [^\""\'\,\r\n] [^\,\r\n]*
	| (\"" [^\""]* \"") +
	| (\' [^\']* \') +
	;
<newline>
	: \r \n? | \n
	;

File
	: Lines {{}}
	;
Lines
	: Line 'line'
	| Lines <newline> 'eol' Line 'line'
	;
Line
	: Value 'value' {{}}
	| Line "","" 'comma' Value 'value' {{}}
	;
Value
	: <entry>
	| Missing
	;
Missing
	: {SmaCCToken value: '' start: self position ids: #()}
	;"