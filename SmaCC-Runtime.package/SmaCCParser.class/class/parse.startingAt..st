accessing
parse: aString startingAt: anInteger
	| value |
	value := self
		parseStream: (ReadStream on: aString)
		startingAt: anInteger.
	(value isKindOf: SmaCCParseNode)
		ifTrue: [ value completeSource: aString ].
	^ value