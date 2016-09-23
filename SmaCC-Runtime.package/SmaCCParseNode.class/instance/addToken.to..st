collection handling
addToken: aSmaCCToken to: aCollection
	aSmaCCToken isNil
		ifTrue: [ ^ self ].
	aCollection add: aSmaCCToken