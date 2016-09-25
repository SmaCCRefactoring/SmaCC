source editing
deleteAllWithWhitespaceAfter: aCollection
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self deleteWithWhitespaceAfter: each ]