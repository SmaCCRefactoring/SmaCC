collection handling
addFirstObject: anObject to: aCollection
	anObject isNil
		ifTrue: [ ^ self ].
	aCollection addFirst: anObject.
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ anObject parent: self ]