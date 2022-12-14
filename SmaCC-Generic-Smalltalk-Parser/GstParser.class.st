Class {
	#name : #GstParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstParser class >> definitionComment [
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
]

{ #category : #'generated-accessing' }
GstParser class >> scannerClass [
	^GstScanner
]

{ #category : #generated }
GstParser class >> startingStateForMethod [
	^ 1
]

{ #category : #generated }
GstParser class >> startingStateForSequence [
	^ 2
]

{ #category : #generated }
GstParser class >> startingStateForStatement [
	^ 3
]

{ #category : #public }
GstParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	actions isEmpty
		ifTrue:
			[ (currentToken ids includes: scanner binaryId)
				ifTrue:
					[ currentToken value = '|'
						ifTrue: [ self addActionsFor: scanner binaryId to: actions ]
						ifFalse:
							[ (#('||' '|||') includes: currentToken value)
								ifTrue:
									[ currentToken := currentToken class
										value: '|'
										start: currentToken startPosition
										ids: (Array with: scanner barId).
									self position: currentToken startPosition.
									actions := super actionsForCurrentToken ] ] ] ].
	^ actions
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForArrayLiteral1: nodes [
	| result |
	result := GstArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForAssignment1: nodes [
	| result |
	result := GstAssignmentNode new.
	result variable: (nodes at: 1).
	result assignmentToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBinaryMessage1: nodes [
	| result |
	result := GstBinaryMessageNode new.
	result selectorPart: (nodes at: 1).
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlock1: nodes [
	| result |
	result := GstBlockNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result colons.
	result addNodes: ((nodes at: 2) at: 2) to: result variables.
	result bar: ((nodes at: 2) at: 3).
	result body: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlockArgs1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBlockArgs2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForBooleanLiteral1: nodes [
	| result |
	result := GstBooleanLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForByteArrayLiteral1: nodes [
	| result |
	result := GstByteArrayLiteralNode new.
	result arrayStart: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result arrayStop: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCascade1: nodes [
	| result |
	result := GstCascadeNode new.
	result receiver: ((nodes at: 1) at: 1).
	result addNode: ((nodes at: 1) at: 2) to: result messages.
	result addTokens: ((nodes at: 2) at: 1) to: result semicolons.
	result addNodes: ((nodes at: 2) at: 2) to: result messages.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCascadedMessages2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForCharacterLiteral1: nodes [
	| result |
	result := GstCharacterLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessage1: nodes [
	| result |
	result := GstKeywordMessageNode new.
	result addToken: (nodes at: 1) to: result selectorParts.
	result addNode: (nodes at: 2) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessage2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result selectorParts.
	result addNode: (nodes at: 3) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordMessageSend1: nodes [
	| result |
	result := GstMessageSendNode new.
	result receiver: ((nodes at: 1) at: 1).
	result message: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordPattern1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForKeywordPattern2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethod1: nodes [
	| result |
	result := GstMethodNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result selectorParts.
	result addNodes: ((nodes at: 1) at: 2) to: result variables.
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethodPattern2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForMethodPattern6: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForNilLiteral1: nodes [
	| result |
	result := GstNilLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForNumberLiteral1: nodes [
	| result |
	result := GstNumberLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForSequence1: nodes [
	| result |
	result := GstSequenceNode new.
	result leftBar: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result variables.
	result rightBar: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result periods.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatement1: nodes [
	| result |
	result := GstReturnNode new.
	result upArrow: (nodes at: 1).
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatement2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatementList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatements1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStatements3: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForStringLiteral1: nodes [
	| result |
	result := GstStringLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForSymbolLiteral1: nodes [
	| result |
	result := GstSymbolLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForTemporaries1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForTemporaries2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForUnaryMessage1: nodes [
	| result |
	result := GstUnaryMessageNode new.
	result selectorPart: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForUnaryMessageSendVars1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForValue4: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariable1: nodes [
	| result |
	result := GstVariableNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariables1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
GstParser >> reduceActionForVariables2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #generated }
GstParser >> reduceTable [
^#(
	#(41 0 #reduceActionForTemporaries1:) 
	#(62 1 #reduceActionForMethodPattern2:) 
	#(62 1 #reduceActionForMethodPattern6:) 
	#(28 0 #reduceActionForVariables1:) 
	#(27 0 #reduceActionForStatements1:) 
	#(61 0 #reduceActionForVariables1:) 
	#(54 1 #reduceActionForBooleanLiteral1:) 
	#(55 1 #reduceActionForNilLiteral1:) 
	#(60 0 #reduceActionForVariables1:) 
	#(46 0 #reduceActionForBlockArgs1:) 
	#(57 1 #reduceActionForVariable1:) 
	#(48 1 #reduceActionForStringLiteral1:) 
	#(53 1 #reduceActionForSymbolLiteral1:) 
	#(52 1 #reduceActionForCharacterLiteral1:) 
	#(49 1 #reduceActionForNumberLiteral1:) 
	#(58 1 #reduceActionForNumberLiteral1:) 
	#(63 1 #reduceActionForStatement2:) 
	#(30 1 #reduceActionForStatement2:) 
	#(36 1 #reduceActionForKeywordMessageSend1:) 
	#(42 1 #reduceActionForKeywordMessageSend1:) 
	#(31 1 #reduceActionForStatement2:) 
	#(59 1 #reduceActionForStatement2:) 
	#(42 1 #reduceActionForStatement2:) 
	#(43 1 #reduceActionForStatement2:) 
	#(44 1 #reduceActionForStatement2:) 
	#(49 1 #reduceActionForStatement2:) 
	#(36 1 #reduceActionForStatement2:) 
	#(59 1 #reduceActionForKeywordMessageSend1:) 
	#(67 2 #reduceActionForKeywordPattern1:) 
	#(62 2 #reduceActionForKeywordPattern1:) 
	#(56 2 #reduceActionForMethod1:) 
	#(66 2 #reduceActionForSequence1:) 
	#(27 1 #reduceActionForMethodPattern6:) 
	#(29 1 #reduceActionForMethodPattern2:) 
	#(63 2 #reduceActionForStatement1:) 
	#(31 2 #reduceActionForCascade1:) 
	#(40 1 #reduceActionForUnaryMessage1:) 
	#(35 2 #reduceActionForUnaryMessageSendVars1:) 
	#(32 2 #reduceActionForUnaryMessageSendVars1:) 
	#(68 2 #reduceActionForUnaryMessageSendVars1:) 
	#(67 3 #reduceActionForKeywordPattern2:) 
	#(41 3 #reduceActionForTemporaries2:) 
	#(28 2 #reduceActionForVariables2:) 
	#(27 2 #reduceActionForStatements3:) 
	#(51 3 #reduceActionForByteArrayLiteral1:) 
	#(61 2 #reduceActionForVariables2:) 
	#(50 3 #reduceActionForArrayLiteral1:) 
	#(60 2 #reduceActionForVariables2:) 
	#(43 3 #reduceActionForValue4:) 
	#(47 2 #reduceActionForKeywordPattern1:) 
	#(46 2 #reduceActionForBlockArgs2:) 
	#(33 2 #reduceActionForKeywordPattern1:) 
	#(37 1 #reduceActionForStatement2:) 
	#(30 3 #reduceActionForAssignment1:) 
	#(38 2 #reduceActionForKeywordMessage1:) 
	#(39 2 #reduceActionForBinaryMessage1:) 
	#(29 3 #reduceActionForStatementList2:) 
	#(45 4 #reduceActionForBlock1:) 
	#(47 3 #reduceActionForKeywordPattern2:) 
	#(33 3 #reduceActionForCascadedMessages2:) 
	#(38 3 #reduceActionForKeywordMessage2:)
	).
]

{ #category : #generated }
GstParser >> symbolNames [
	^ #('"^"' '"."' '"#["' '":="' '"true"' '"nil"' '"false"' '";"' '"#("' '":"' '"]"' '"("' '")"' '"["' '<name>' '<keyword>' '<bar>' '<binary>' '<string>' '<symbol>' '<character>' '<comment>' '<whitespace>' '<float>' '<integer>' '<patternToken>' 'Statements' 'Variables' 'StatementList' 'Assignment' 'Cascade' 'KeywordMessageSendVars' 'CascadedMessages' 'B e g i n' 'UnaryMessageSendVars' 'KeywordMessageSend' 'CascadedMessage' 'KeywordMessage' 'BinaryMessage' 'UnaryMessage' 'Temporaries' 'UnaryMessageSend' 'Value' 'Literal' 'Block' 'BlockArgs' 'BlockArgList' 'StringLiteral' 'NumberLiteral' 'ArrayLiteral' 'ByteArrayLiteral' 'CharacterLiteral' 'SymbolLiteral' 'BooleanLiteral' 'NilLiteral' 'Method' 'Variable' 'IntegerLiteral' 'BinaryMessageSend' 'ArrayLiteralItems' 'ByteArrayLiteralItems' 'MethodPattern' 'Statement' 'E O F' 'error' 'Sequence' 'KeywordPattern' 'BinaryMessageSendVars')
]

{ #category : #generated }
GstParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #GstValueNode #GstValueNode #OrderedCollection #OrderedCollection #GstMethodNode #OrderedCollection #GstValueNode #GstMessageNode #GstKeywordMessageNode #GstBinaryMessageNode #GstUnaryMessageNode #OrderedCollection #GstValueNode #GstValueNode #GstLiteralNode #GstBlockNode #OrderedCollection #OrderedCollection #GstStringLiteralNode #GstNumberLiteralNode #GstArrayLiteralNode #GstByteArrayLiteralNode #GstCharacterLiteralNode #GstSymbolLiteralNode #GstBooleanLiteralNode #GstNilLiteralNode #GstMethodNode #GstVariableNode #GstNumberLiteralNode #GstValueNode #OrderedCollection #OrderedCollection #OrderedCollection #GstProgramNode #SmaCCToken #SmaCCToken #GstSequenceNode #OrderedCollection #OrderedCollection)
]

{ #category : #generated }
GstParser >> transitionTable [
^#(
#[1 0 17 0 5 0 21 0 6 0 25 0 7 0 29 0 15 0 33 0 16 0 37 0 18 0 41 0 56 0 45 0 62 0 49 0 67] 
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 12 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 0 57 0 41 0 6 0 64 0 61 0 66] 
#[1 0 65 0 1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 121 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 0 201 0 63 0 205 0 68] 
#[0 0 10 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 10 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 10 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 10 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[1 0 97 0 15 0 209 0 57] 
#[1 0 97 0 15 0 213 0 57] 
#[0 0 0 0 64] 
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 12 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 0 57 0 41 0 6 0 64 0 217 0 66] 
#[1 0 14 0 1 0 14 0 3 0 14 0 5 0 14 0 6 0 14 0 7 0 14 0 9 0 14 0 12 0 14 0 14 0 14 0 15 0 221 0 16 0 14 0 17 0 14 0 19 0 14 0 20 0 14 0 21 0 14 0 24 0 14 0 25 0 14 0 64] 
#[1 0 18 0 15 0 18 0 17 0 225 0 28] 
#[1 0 65 0 1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 22 0 11 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 229 0 27 0 233 0 29 0 121 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 0 237 0 63 0 22 0 64 0 205 0 68] 
#[0 0 0 0 64] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 241 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 0 205 0 68] 
#[1 0 26 0 11 0 26 0 25 0 245 0 61] 
#[0 0 30 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 34 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 30 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[1 0 38 0 3 0 38 0 5 0 38 0 6 0 38 0 7 0 38 0 9 0 38 0 13 0 38 0 19 0 38 0 20 0 38 0 21 0 38 0 24 0 38 0 25 0 249 0 60] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 253 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 0 205 0 68] 
#[1 0 42 0 1 0 42 0 3 0 42 0 5 0 42 0 6 0 42 0 7 0 42 0 9 1 1 0 10 0 42 0 11 0 42 0 12 0 42 0 14 0 42 0 15 0 42 0 17 0 42 0 19 0 42 0 20 0 42 0 21 0 42 0 24 0 42 0 25 1 5 0 46 1 9 0 47] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 50 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 54 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 58 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 62 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 66 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 70 0 2 0 11 0 64] 
#[0 0 74 0 2 0 11 0 13 0 64] 
#[1 0 78 0 2 1 13 0 8 0 78 0 11 0 78 0 13 1 17 0 33 0 78 0 64] 
#[1 0 82 0 2 1 13 0 8 0 82 0 11 0 82 0 13 0 82 0 15 0 82 0 16 0 82 0 18 1 21 0 33 0 82 0 64] 
#[0 0 86 0 2 0 11 0 13 0 64] 
#[1 0 90 0 2 0 90 0 8 0 90 0 11 0 90 0 13 1 25 0 15 0 90 0 16 0 90 0 18 1 29 0 40 0 90 0 64] 
#[0 0 94 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 98 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 98 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 102 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[1 0 98 0 2 1 33 0 4 0 98 0 11 0 98 0 13 0 98 0 15 0 98 0 16 0 98 0 18 0 98 0 64] 
#[0 0 106 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[1 0 110 0 2 0 110 0 11 0 110 0 13 1 37 0 16 1 41 0 18 1 45 0 38 1 49 0 39 0 110 0 64] 
#[0 0 0 0 64] 
#[1 0 114 0 2 1 13 0 8 0 114 0 11 0 114 0 13 0 114 0 16 0 114 0 18 1 53 0 33 0 114 0 64] 
#[0 0 118 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 122 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 126 0 64] 
#[1 0 97 0 15 1 57 0 57] 
#[1 0 97 0 15 1 61 0 17 1 65 0 57] 
#[0 0 130 0 11 0 64] 
#[1 1 69 0 2 0 134 0 11 0 134 0 64] 
#[0 0 138 0 2 0 11 0 64] 
#[0 0 142 0 2 0 11 0 64] 
#[1 1 73 0 11 0 117 0 25 1 77 0 58] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 1 81 0 13 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 85 0 44 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 193 0 58] 
#[0 1 89 0 13] 
#[1 0 97 0 15 1 93 0 57] 
#[1 0 6 0 1 0 6 0 3 0 6 0 5 0 6 0 6 0 6 0 7 0 6 0 9 0 6 0 11 0 6 0 12 0 6 0 14 0 6 0 15 0 53 0 17 0 6 0 19 0 6 0 20 0 6 0 21 0 6 0 24 0 6 0 25 0 57 0 41 1 97 0 66] 
#[1 1 101 0 10 1 105 0 17] 
#[1 1 25 0 15 1 37 0 16 1 41 0 18 1 109 0 37 1 113 0 38 1 117 0 39 1 121 0 40] 
#[0 0 146 0 2 0 11 0 13 0 64] 
#[0 0 146 0 2 0 11 0 13 0 64] 
#[0 0 150 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 154 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 125 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 0 205 0 68] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 129 0 35 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 1 133 0 57 0 193 0 58 1 137 0 59 1 141 0 68] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 129 0 35 1 145 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 1 133 0 57 0 193 0 58] 
#[1 0 158 0 2 0 158 0 8 0 158 0 11 0 158 0 13 1 149 0 16 0 158 0 64] 
#[0 0 162 0 2 0 8 0 11 0 13 0 16 0 18 0 64] 
#[0 0 146 0 2 0 11 0 13 0 64] 
#[0 0 166 0 1 0 3 0 5 0 6 0 7 0 9 0 12 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 170 0 1 0 3 0 5 0 6 0 7 0 9 0 11 0 12 0 14 0 15 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 174 0 15 0 17] 
#[1 0 65 0 1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 178 0 11 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 0 121 0 30 0 125 0 31 0 129 0 32 0 133 0 35 0 137 0 36 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 0 189 0 57 0 193 0 58 0 197 0 59 1 153 0 63 0 178 0 64 0 205 0 68] 
#[0 0 182 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 186 0 11 0 25] 
#[0 0 190 0 2 0 3 0 5 0 6 0 7 0 8 0 9 0 11 0 13 0 15 0 16 0 18 0 19 0 20 0 21 0 24 0 25 0 64] 
#[0 0 194 0 3 0 5 0 6 0 7 0 9 0 13 0 19 0 20 0 21 0 24 0 25] 
#[0 0 198 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 202 0 10 0 17] 
#[0 1 157 0 11] 
#[1 0 97 0 15 1 161 0 57] 
#[0 0 206 0 1 0 3 0 5 0 6 0 7 0 9 0 11 0 12 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 25] 
#[1 0 210 0 2 1 13 0 8 0 210 0 11 0 210 0 13 1 165 0 33 0 210 0 64] 
#[1 0 214 0 2 0 214 0 8 0 214 0 11 0 214 0 13 1 149 0 16 0 214 0 64] 
#[0 0 214 0 2 0 8 0 11 0 13 0 64] 
#[0 0 214 0 2 0 8 0 11 0 13 0 64] 
#[0 0 218 0 2 0 11 0 13 0 64] 
#[0 0 82 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 98 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[1 0 222 0 2 0 222 0 8 0 222 0 11 0 222 0 13 0 222 0 16 1 41 0 18 1 49 0 39 0 222 0 64] 
#[0 0 114 0 2 0 8 0 11 0 13 0 16 0 18 0 64] 
#[1 0 226 0 2 0 226 0 8 0 226 0 11 0 226 0 13 1 25 0 15 0 226 0 16 0 226 0 18 1 29 0 40 0 226 0 64] 
#[1 0 69 0 3 0 73 0 5 0 77 0 6 0 81 0 7 0 85 0 9 0 89 0 12 0 93 0 14 0 97 0 15 0 101 0 19 0 105 0 20 0 109 0 21 0 113 0 24 0 117 0 25 1 129 0 35 0 141 0 42 0 145 0 43 0 149 0 44 0 153 0 45 0 157 0 48 0 161 0 49 0 165 0 50 0 169 0 51 0 173 0 52 0 177 0 53 0 181 0 54 0 185 0 55 1 133 0 57 0 193 0 58 1 169 0 59 1 141 0 68] 
#[0 0 230 0 2 0 11 0 64] 
#[0 0 234 0 2 0 8 0 11 0 13 0 15 0 16 0 18 0 64] 
#[0 0 238 0 10 0 17] 
#[0 0 242 0 2 0 11 0 13 0 64] 
#[1 0 246 0 2 0 246 0 8 0 246 0 11 0 246 0 13 0 246 0 16 1 41 0 18 1 49 0 39 0 246 0 64]
	).
]
