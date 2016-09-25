collection handling
addNode: aSmaCCParseNode to: aCollection
	aSmaCCParseNode isNil
		ifTrue: [ ^ self ].
	aCollection add: aSmaCCParseNode.
	aSmaCCParseNode parent: self