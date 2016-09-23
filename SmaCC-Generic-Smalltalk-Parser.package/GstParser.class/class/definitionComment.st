generated
definitionComment
"%glr;
%prefix Gst;
%suffix Node;
%root Program;
%start Sequence Statement;
%id <bar> <binary>;
%hierarchy Value (
	Assignment
	Block
	Cascade
	Literal
	MessageSend
	Variable
);
%hierarchy Literal (StringLiteral NumberLiteral CharacterLiteral SymbolLiteral ArrayLiteral BooleanLiteral NilLiteral);
%hierarchy ArrayLiteral (ByteArrayLiteral);
%hierarchy Message (UnaryMessage BinaryMessage KeywordMessage);
%ignore_variables leftParen rightParen leftBar rightBar leftBracket rightBracket semicolon colon period ;
<name>
	:  (<isLetter> | _ ) ( <isLetter> | _ | <isDigit> ) *
	;
<keyword>
	: <name> \:
	;
<bar>
	: \|
	;
<binary>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,] +
	;
<string>
	: ( \' [^\']* \' )+
	;
<symbol>
	: \# ( <name> | <binary> | <keyword>+ | <string> )
	;
<character>
	: \$ .
	;
<comment>
	: \"" [^\""]* \""
	;
<whitespace>
	: \s+
	;
<float>
	: \-? \d+ \. \d+ ([deq] [\+\-]? \d+)?
	| \-? \d+ [deq] [\+\-]? \d+
	;
<integer>
	: \-? (
		  \d+
		| 2r[0-1]+
		| 3r[0-2]+
		| 4r[0-3]+
		| 5r[0-4]+
		| 6r[0-5]+
		| 7r[0-6]+
		| 8r[0-7]+
		| 9r[0-8]+
		| 10r[0-9]+
		| 11r[0-9A]+
		| 12r[0-9A-B]+
		| 13r[0-9A-C]+
		| 14r[0-9A-D]+
		| 15r[0-9A-E]+
		| 16r[0-9A-F]+
		| 17r[0-9A-G]+
		| 18r[0-9A-H]+
		| 19r[0-9A-I]+
		| 20r[0-9A-J]+
		| 21r[0-9A-K]+
		| 22r[0-9A-L]+
		| 23r[0-9A-M]+
		| 24r[0-9A-N]+
		| 25r[0-9A-O]+
		| 26r[0-9A-P]+
		| 27r[0-9A-Q]+
		| 28r[0-9A-R]+
		| 29r[0-9A-S]+
		| 30r[0-9A-T]+
		| 31r[0-9A-U]+
		| 32r[0-9A-V]+
		| 33r[0-9A-W]+
		| 34r[0-9A-X]+
		| 35r[0-9A-Y]+
		| 36r[0-9A-Z]+
		)
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;
Method
	: MethodPattern Sequence 'body' {{}}
	;
MethodPattern
	: <name> 'selectorPart'
	| ""true"" 'selectorPart'
	| ""false"" 'selectorPart'
	| ""nil"" 'selectorPart'
	| <binary> 'selectorPart' Variable 'variable'
	| KeywordPattern
	;
KeywordPattern
	: <keyword> 'selectorPart' Variable 'variable'
	| KeywordPattern <keyword> 'selectorPart' Variable 'variable'
	;
Sequence
	: Temporaries Statements {{}}
	;
Temporaries
	: 
	| <bar> 'leftBar' Variables <bar> 'rightBar'
	;
Variables
	: 
	| Variables Variable 'variable'
	;
Statements
	: 
	| StatementList
	| StatementList ""."" 'period'
	;
StatementList
	: Statement 'statement'
	| StatementList ""."" 'period' Statement 'statement'
	;
Statement
	: ""^"" 'upArrow' Assignment 'value' {{Return}}
	| Assignment
	;
Assignment
	: Variable 'variable' "":="" 'assignmentToken' Assignment 'value' {{}}
	| Cascade
	;
Cascade
	: KeywordMessageSendVars CascadedMessages {{}}
	| BinaryMessageSendVars CascadedMessages {{}}
	| UnaryMessageSendVars CascadedMessages {{}}
	| KeywordMessageSend
	;
CascadedMessages
	: "";"" 'semicolon' CascadedMessage 'message'
	| "";"" 'semicolon' CascadedMessage 'message' CascadedMessages
	;
CascadedMessage
	: KeywordMessage
	| BinaryMessage
	| UnaryMessage
	;
KeywordMessageSend
	: KeywordMessageSendVars {{MessageSend}}
	| BinaryMessageSend
	;
KeywordMessageSendVars
	: BinaryMessageSend 'receiver' KeywordMessage 'message' 
	;
KeywordMessage
	: <keyword> 'selectorPart' BinaryMessageSend 'value' {{}}
	| KeywordMessage <keyword> 'selectorPart' BinaryMessageSend 'value' {{}}
	;
BinaryMessageSend
	: BinaryMessageSendVars {{MessageSend}}
	| UnaryMessageSend
	;
BinaryMessageSendVars
	: BinaryMessageSend 'receiver' BinaryMessage 'message' 
	;
BinaryMessage
	: <binary> 'selectorPart' UnaryMessageSend 'value' {{}}
	;
UnaryMessageSend
	: UnaryMessageSendVars {{MessageSend}}
	| Value
	;
UnaryMessageSendVars
	: UnaryMessageSend 'receiver' UnaryMessage 'message' 
	;
UnaryMessage
	: <name> 'selectorPart' {{}}
	;
Variable
	: <name> 'name' {{}}
	;
Value
	: Variable
	| Literal
	| Block
	| ""("" 'leftParen' Assignment "")"" 'rightParen' {{Value}}
	;
Block
	: ""["" 'leftBracket' BlockArgs Sequence 'body' ""]"" 'rightBracket' {{}}
	;
BlockArgs
	: 
	| BlockArgList <bar> 'bar'
	;
BlockArgList
	: "":"" 'colon' Variable 'variable'
	| BlockArgList "":"" 'colon' Variable 'variable'
	;
Literal
	: StringLiteral
	| NumberLiteral
	| ArrayLiteral
	| ByteArrayLiteral
	| CharacterLiteral
	| SymbolLiteral
	| BooleanLiteral
	| NilLiteral
	;
StringLiteral
	: <string> 'value' {{}}
	;
NumberLiteral
	: <float> 'value' {{}}
	| IntegerLiteral
	;
IntegerLiteral
	: <integer> 'value' {{NumberLiteral}}
	;
ArrayLiteral
	: ""#("" 'arrayStart' ArrayLiteralItems "")"" 'arrayStop' {{}}
	;
ArrayLiteralItems
	: 
	| ArrayLiteralItems Literal 'value'
	;
ByteArrayLiteral
	: ""#["" 'arrayStart' ByteArrayLiteralItems ""]"" 'arrayStop' {{}}
	;
ByteArrayLiteralItems
	: 
	| ByteArrayLiteralItems IntegerLiteral 'value' 
	;
CharacterLiteral
	: <character> 'value' {{}}
	;
SymbolLiteral
	: <symbol> 'value' {{}}
	;
BooleanLiteral
	: ""true"" 'value' {{}}
	| ""false"" 'value' {{}}
	;
NilLiteral
	: ""nil"" 'value' {{}}
	;"