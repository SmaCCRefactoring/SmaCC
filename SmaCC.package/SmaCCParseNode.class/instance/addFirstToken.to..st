collection
addFirstToken: aSmaCCToken to: aCollection
	aSmaCCToken isNil
		ifTrue: [ ^ self ].
	aCollection addFirst: aSmaCCToken