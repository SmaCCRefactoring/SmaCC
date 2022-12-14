Class {
	#name : #SmaCCReplaceExpressionParser,
	#superclass : #SmaCCParser,
	#category : 'SmaCC-Rewrite-Engine'
}

{ #category : #'generated-accessing' }
SmaCCReplaceExpressionParser class >> cacheId [
	^'2017-05-03T19:52:46.171303+02:00'
]

{ #category : #generated }
SmaCCReplaceExpressionParser class >> definitionComment [
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
]

{ #category : #'generated-accessing' }
SmaCCReplaceExpressionParser class >> scannerClass [
	^SmaCCReplaceExpressionScanner
]

{ #category : #generated }
SmaCCReplaceExpressionParser class >> startingStateForExpression [
	^ 1
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForCodeReplace1: nodes [
	| result |
	result := SmaCCCodeReplaceExpression new.
	result code: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForExpression1: nodes [
	| result |
	result := SmaCCCompositeReplaceExpression new.
	result addNodes: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForNodeReplace1: nodes [
	| result |
	result := SmaCCNodeReplaceExpression new.
	result beforeWhitespace: ((nodes at: 3) at: 1).
	result beforePrefix: ((nodes at: 3) at: 2).
	result prefix: ((nodes at: 3) at: 3).
	result name: (nodes at: 4).
	result postfix: ((nodes at: 5) at: 1).
	result afterPostfix: ((nodes at: 5) at: 2).
	result afterWhitespace: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForPostfixModifiers1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForPrefixModifiers1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForPrefixModifiers2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForRewriteExpression3: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForRewriteExpressions1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForRewriteExpressions2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForStringReplace1: nodes [
	| result |
	result := SmaCCStringReplaceExpression new.
	result string: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForSwitchStateToCode1: nodes [
	self state: #code.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForSwitchStateToDefault1: nodes [
	self state: #default.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCReplaceExpressionParser >> reduceActionForSwitchStateToExpression1: nodes [
	self state: #expression.
	^ nil
]

{ #category : #generated }
SmaCCReplaceExpressionParser >> reduceTable [
^#(
	#(22 0 #reduceActionForRewriteExpressions1:) 
	#(17 0 #reduceActionForSwitchStateToExpression1:) 
	#(16 0 #reduceActionForSwitchStateToCode1:) 
	#(12 1 #reduceActionForExpression1:) 
	#(10 1 #reduceActionForStringReplace1:) 
	#(11 1 #reduceActionForRewriteExpression3:) 
	#(22 2 #reduceActionForRewriteExpressions2:) 
	#(18 0 #nil) 
	#(15 0 #reduceActionForSwitchStateToDefault1:) 
	#(18 1 #reduceActionForRewriteExpression3:) 
	#(21 0 #nil) 
	#(19 1 #reduceActionForRewriteExpression3:) 
	#(21 1 #reduceActionForRewriteExpression3:) 
	#(23 2 #reduceActionForPrefixModifiers2:) 
	#(8 5 #reduceActionForCodeReplace1:) 
	#(23 4 #reduceActionForPrefixModifiers1:) 
	#(14 2 #reduceActionForPrefixModifiers2:) 
	#(9 7 #reduceActionForNodeReplace1:) 
	#(14 4 #reduceActionForPostfixModifiers1:)
	).
]

{ #category : #generated }
SmaCCReplaceExpressionParser >> symbolNames [
	^ #('<name>' '<newline>' '<special_characters>' '<end_of_expression_character>' '<string>' '<backquote>' '<double_backquote>' 'CodeReplace' 'NodeReplace' 'StringReplace' 'RewriteExpression' 'Expression' '<codeExpression>' 'PostfixModifiers' 'SwitchStateToDefault' 'SwitchStateToCode' 'SwitchStateToExpression' 'OptionalWhitespace' 'Characters' 'B e g i n' 'OptionalCharacters' 'RewriteExpressions' 'PrefixModifiers' 'E O F' 'error')
]

{ #category : #generated }
SmaCCReplaceExpressionParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCCodeReplaceExpression #SmaCCNodeReplaceExpression #SmaCCStringReplaceExpression #SmaCCReplaceExpression #SmaCCCompositeReplaceExpression #SmaCCToken #OrderedCollection nil nil nil #SmaCCToken #SmaCCToken #SmaCCCompositeReplaceExpression #SmaCCToken #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
SmaCCReplaceExpressionParser >> transitionTable [
^#(
#[1 0 6 0 5 0 6 0 6 0 6 0 7 0 9 0 12 0 13 0 22 0 6 0 24] 
#[0 0 0 0 24] 
#[1 0 17 0 5 0 10 0 6 0 14 0 7 0 21 0 8 0 25 0 9 0 29 0 10 0 33 0 11 0 37 0 16 0 41 0 17 0 18 0 24] 
#[0 0 22 0 5 0 6 0 7 0 24] 
#[0 0 26 0 5 0 6 0 7 0 24] 
#[0 0 26 0 5 0 6 0 7 0 24] 
#[0 0 26 0 5 0 6 0 7 0 24] 
#[0 0 30 0 5 0 6 0 7 0 24] 
#[0 0 45 0 7] 
#[0 0 49 0 6] 
#[0 0 53 0 13] 
#[1 0 34 0 1 0 57 0 2 0 34 0 3 0 61 0 18 0 65 0 23] 
#[1 0 38 0 7 0 69 0 15] 
#[0 0 42 0 1 0 3 0 6] 
#[1 0 46 0 1 0 73 0 3 0 77 0 19 0 81 0 21] 
#[0 0 85 0 1] 
#[0 0 89 0 7] 
#[0 0 50 0 1 0 2 0 4 0 6] 
#[1 0 54 0 1 0 93 0 4] 
#[0 0 58 0 1] 
#[1 0 46 0 2 0 73 0 3 0 46 0 4 0 46 0 6 0 97 0 14 0 101 0 19 0 105 0 21] 
#[0 0 62 0 5 0 6 0 7 0 24] 
#[1 0 46 0 1 0 73 0 3 0 101 0 19 0 109 0 21] 
#[1 0 38 0 6 0 113 0 15] 
#[0 0 54 0 1 0 2 0 4 0 6] 
#[1 0 57 0 2 0 117 0 4 0 34 0 6 0 121 0 18] 
#[0 0 66 0 1] 
#[0 0 125 0 6] 
#[1 0 73 0 3 0 129 0 19] 
#[0 0 70 0 6] 
#[0 0 74 0 5 0 6 0 7 0 24] 
#[1 0 57 0 2 0 34 0 6 0 133 0 18] 
#[0 0 78 0 6]
	).
]
