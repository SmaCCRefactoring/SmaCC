"
SmaCCPatternToken is a token for pattern nodes.

Instance Variables:
	isList	<Boolean>	do we match collections or single objects
	isNode	<Boolean>	can we match other parse nodes
	isToken	<Boolean>	can we match other tokens
	nodeClassName	<Symbol>	when matching a parse node, limit it to these types of nodes
	testBlock	<BlockClosure>	after a match, run some code that tests the match


"
Class {
	#name : #SmaCCPatternToken,
	#superclass : #SmaCCToken,
	#instVars : [
		'isList',
		'isToken',
		'isNode',
		'testBlock',
		'nodeClassName'
	],
	#category : 'SmaCC-GLR-Runtime'
}

{ #category : #comparing }
SmaCCPatternToken >> = aSmaCCToken [
	^ self class = aSmaCCToken class
		and: [ self name = aSmaCCToken name ]
]

{ #category : #accessing }
SmaCCPatternToken >> beList [
	isList := true
]

{ #category : #accessing }
SmaCCPatternToken >> beNode [
	isNode := true.
	isToken := false
]

{ #category : #accessing }
SmaCCPatternToken >> beToken [
	isToken := true.
	isNode := false
]

{ #category : #accessing }
SmaCCPatternToken >> beTokenOrNode [
	isToken := true.
	isNode := true
]

{ #category : #private }
SmaCCPatternToken >> buildStructure [
	"In there, if we have a pattern like `op{beToken}`, we will execute self beToken as well, after checking that the smalltalk code between curly braces is a correct Smalltalk expression, which limits a bit what can be written between the curly braces (but someone could write almost anything with a bit of creativity)."

	| index code source |
	isList := isToken := false.
	isNode := true.
	testBlock := [ :node | true ].
	index := value indexOf: ${.
	index > 0
		ifFalse: [ ^ self ].
	code := value copyFrom: index + 1 to: (value lastIndexOf: $}) - 1.
	"transform something like {beNode} in 'self beNode'."
	source := 'self ' , code.
	"Syntax checking."
	RBParser
		parseExpression: source
		onError: [ :s :p | self error: 'Invalid pattern expression' ].
	"evaluate..."
	self class compiler
		source: source;
		logged: false;
		receiver: self;
		evaluate
]

{ #category : #matching }
SmaCCPatternToken >> copyInContext: aDictionary [
	^ aDictionary at: self
]

{ #category : #comparing }
SmaCCPatternToken >> hash [
	^ self class hash bitXor: self name hash
]

{ #category : #testing }
SmaCCPatternToken >> isListMatch [
	^ isList
]

{ #category : #testing }
SmaCCPatternToken >> isNode [
	^ isNode
]

{ #category : #testing }
SmaCCPatternToken >> isPattern [
	^ true
]

{ #category : #testing }
SmaCCPatternToken >> isToken [
	^ isToken
]

{ #category : #matching }
SmaCCPatternToken >> match: aSmaCCToken inContext: aDictionary [
	^ (aSmaCCToken isKindOf: SmaCCToken)
		and:
			[ (aDictionary at: self ifAbsentPut: [ aSmaCCToken ]) = aSmaCCToken
				and: [ self testBlock value: aSmaCCToken ] ]
]

{ #category : #accessing }
SmaCCPatternToken >> name [
	| resultStream readStream char |
	(value first isAlphaNumeric or: [ value first == $_ ])
		ifTrue: [ ^ value ].
	resultStream := WriteStream on: String new.
	readStream := ReadStream on: value.
	readStream next.
	[ char := readStream next.
	char isLetter or: [ char == $_ ] ] whileFalse.
	[ resultStream nextPut: char.
	char := readStream next.
	char isAlphaNumeric or: [ char == $_ ] ] whileTrue.
	^ resultStream contents
]

{ #category : #accessing }
SmaCCPatternToken >> nodeClassName [
	^ nodeClassName
]

{ #category : #accessing }
SmaCCPatternToken >> nodeClassName: aString [
	nodeClassName := aString
]

{ #category : #accessing }
SmaCCPatternToken >> testBlock [
	^ [ :node | 
	(nodeClassName isNil
		or:
			[ node
				isKindOf:
					(node class environment
						at: self nodeClassName
						ifAbsent: [ SmaCCParseNode ]) ]) and: [ testBlock value: node ] ]
]

{ #category : #accessing }
SmaCCPatternToken >> testBlock: aBlock [
	testBlock := aBlock
]

{ #category : #'initialize-release' }
SmaCCPatternToken >> value: aString start: startPositionInteger ids: aCollection [
	super value: aString start: startPositionInteger ids: aCollection.
	self buildStructure
]
