collection handling
addFirstNodes: aSmaCCParseNodeCollection to: aCollection
	aSmaCCParseNodeCollection isNil
		ifTrue: [ ^ self ].
	aSmaCCParseNodeCollection
		reverseDo: [ :each | self addFirstNode: each to: aCollection ]