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
<method>
	: \#([^!]|!!)+ !
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
	| Comment 'comment' <method> 'method' {SmaCCRewriteMethodDefinition comment: comment source: ((method value copyFrom: 2 to: method value size - 1) copyReplaceAll: '!!' with: '!')}
	| Comment 'comment' Variables 'variables' {SmaCCRewritePropertyDefinition comment: comment locals: ((variables reject: [:each | each first]) collect: [:each | each last]) globals: ((variables select: [:each | each first]) collect: [:each | each last])}
	;
Comment
	: {nil}
	| <cmt> {('1' value copyFrom: 2 to: '1' value size - 1) copyReplaceAll: '""""' with: '""'}
	;
Variables
	: ""("" VariableList 'vars' "")"" {vars}
	;
VariableList
	: {OrderedCollection new}
	| VariableList 'vars' Variable 'var' {vars add: var; yourself}
	;
Variable
	: ""-"" <name> 'name' {Array with: false with: name value}
	| ""+"" <name> 'name' {Array with: true with: name value}
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