collection
addFirstTokens: aSmaCCTokenCollection to: aCollection
	aSmaCCTokenCollection isNil
		ifTrue: [ ^ self ].
	aCollection addAll: aSmaCCTokenCollection beforeIndex: 1