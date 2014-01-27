generated
definitionComment
"<singleName>
	: (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	;
<name>
	: <singleName> (\. <singleName>)*
	;
<string>
	: (\' [^\']* \') +
	;
<cmt>
	: (\""[^\""]*\"")+
	;
<whitespace>
	: <isSeparator>+
	;
File
	: Rules {'1'}
	;
Rules
	: {SmaCCRewriteFile new filename: filename; yourself}
	| Rules Rule {'1' addTransformation: '2'; yourself}
	| Rules ParserClass {'1' parserClass: '2'; yourself}
	| Rules Import {'1' import: '2'; yourself}
	;
ParserClass
	: ""Parser"" "":"" <name> 'name' {self lookupClass: name}
	;
Import
	: ""Import"" "":"" <string> 'name' {(name value copyFrom: 2 to: name value size - 1) copyReplaceAll: '''''' with: ''''}
	;
Rule
	: Comment 'comment' Match 'match' ""->"" Transformation 'transformation' {SmaCCRewrite comment: comment match: match transformation: transformation}
	;
Comment
	: {nil}
	| <cmt> {('1' value copyFrom: 2 to: '1' value size - 1) copyReplaceAll: '""""' with: '""'}
	;
Match
	: StringExpression {SmaCCRewriteTreeMatch new source: '1'; yourself}
	| <name> 'state' StringExpression 'exp' {SmaCCRewriteTreeMatch new source: exp; startingState: state value; yourself}
	| <name> {SmaCCRewriteTypeMatch on: (self lookupClass: '1')}
	| <name> Block {(SmaCCRewriteTypeMatch on: (self lookupClass: '1')) code: '2'; yourself}
	;
StringExpression
	: StartStringExpression 'string' "">>>"" ""<<<"" {string}
	;
Transformation
	: StringExpression {SmaCCRewriteStringTransformation on: '1'}
	| Block {SmaCCRewriteCodeTransformation on: '1'}
	;
Block
	: StartSmalltalkExpression 'string' ""[""  ""]"" {string}
	;
StartStringExpression
	: {self scanStringExpression}
	;
StartSmalltalkExpression
	: {self scanSmalltalkExpression}
	;"
