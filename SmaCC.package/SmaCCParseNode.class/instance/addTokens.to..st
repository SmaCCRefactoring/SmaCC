collection
addTokens: aSmaCCTokenCollection to: aCollection
	aSmaCCTokenCollection isNil
		ifTrue: [ ^ self ].
	aCollection addAll: aSmaCCTokenCollection