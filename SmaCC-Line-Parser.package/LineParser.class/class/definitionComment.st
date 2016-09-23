generated
definitionComment
"%root FileNode;

<line>
	: [^\r\n]+
	;
<newLine>
	: \r | \n | \r\n
	;

File
	: Lines {{FileNode}}
	;
Lines
	: Line
	| Lines <newLine> Line
	;
Line
	: 
	| <line> 'line'
	;"