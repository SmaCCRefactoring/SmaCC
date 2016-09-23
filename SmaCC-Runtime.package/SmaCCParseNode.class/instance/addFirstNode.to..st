collection handling
addFirstNode: aSmaCCParseNode to: aCollection
	aSmaCCParseNode isNil
		ifTrue: [ ^ self ].
	aCollection addFirst: aSmaCCParseNode.
	aSmaCCParseNode parent: self