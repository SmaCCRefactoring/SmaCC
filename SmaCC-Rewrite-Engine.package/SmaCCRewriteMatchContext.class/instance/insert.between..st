source editing
insert: aString between: aCollection
	aCollection isNil
		ifTrue: [ ^ self ].
	1 to: aCollection size - 1 do: [ :i | self insert: aString after: (aCollection at: i) ]