generated
definitionComment
"%excludes expression code ;
%id <codeExpression>;

expression <name>
	: (<isLetter> | _) (<isLetter> | _ | <isDigit>) *
	;
expression <newline>
	: \\
	;
expression <special_characters>
	: [\~\!\@\#\$\%\^\&\*\(\)\-\+\=\|\{\[\]\}\<\,\>\.\?\/\;\:\'\""]+
	;
expression <end_of_expression_character>
	: _
	;
<string>
	: [^`]+
	;
default expression <backquote>
	: `
	;
default code <double_backquote>
	: ``
	;

%prefix SmaCC;
%suffix Expression;
%root Replace;

Expression
	: RewriteExpressions {{CompositeReplace}}
	;
RewriteExpressions
	: 
	| RewriteExpressions RewriteExpression 'expression'
	;
RewriteExpression
	: StringReplace
	| NodeReplace
	| CodeReplace
	;
StringReplace
	: <string> 'string' {{StringReplace}}
	;
NodeReplace
	: SwitchStateToExpression <backquote> PrefixModifiers <name> 'name' PostfixModifiers SwitchStateToDefault <backquote> {{NodeReplace}}
	;
SwitchStateToDefault
	: {self state: #default. nil}
	;
SwitchStateToExpression
	: {self state: #expression. nil}
	;
CodeReplace
	: SwitchStateToCode <double_backquote> <codeExpression> 'code' SwitchStateToDefault <double_backquote> {{CodeReplace}}
	;
SwitchStateToCode
	: {self state: #code. nil}
	;
PrefixModifiers
	: OptionalWhitespace 'beforeWhitespace' Characters 'beforePrefix' <end_of_expression_character> OptionalCharacters 'prefix'
	| OptionalWhitespace 'beforeWhitespace' OptionalCharacters 'prefix'
	;
PostfixModifiers
	: OptionalCharacters 'postfix' <end_of_expression_character> Characters 'afterPostfix' OptionalWhitespace 'afterWhitespace'
	| OptionalCharacters 'postfix' OptionalWhitespace 'afterWhitespace'
	;
OptionalWhitespace
	: 
	| <newline>
	;
OptionalCharacters
	: 
	| Characters
	;
Characters
	: <special_characters> 'characters'
	;"