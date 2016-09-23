collection handling
addObject: anObject to: aCollection
	anObject isNil
		ifTrue: [ ^ self ].
	aCollection add: anObject.
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ anObject parent: self ]