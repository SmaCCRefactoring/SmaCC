initialize
action: anObject
	anObject isNil
		ifTrue: [ ^ self ].
	action := anObject isSymbol
		ifTrue: [ anObject ]
		ifFalse: [ SortedCollection with: anObject ]