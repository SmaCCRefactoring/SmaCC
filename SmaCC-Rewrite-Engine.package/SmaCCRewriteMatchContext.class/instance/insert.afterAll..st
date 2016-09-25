source editing
insert: aString afterAll: aCollection
	aCollection isNil
		ifTrue: [ ^ self ].
	aCollection do: [ :each | self insert: aString after: each ]