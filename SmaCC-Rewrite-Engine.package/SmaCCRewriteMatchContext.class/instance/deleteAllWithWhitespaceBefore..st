source editing
deleteAllWithWhitespaceBefore: aCollection
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self deleteWithWhitespaceBefore: each ]