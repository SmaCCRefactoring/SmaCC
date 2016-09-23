collection handling
addNodes: aSmaCCParseNodeCollection to: aCollection
	aSmaCCParseNodeCollection isNil
		ifTrue: [ ^ self ].
	aSmaCCParseNodeCollection
		do: [ :each | self addNode: each to: aCollection ]