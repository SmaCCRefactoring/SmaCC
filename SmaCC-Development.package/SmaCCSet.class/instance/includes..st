testing
includes: anObject
	^ (anObject isKindOf: Character)
		ifTrue: [ characters includes: anObject ]
		ifFalse: [ objects includes: anObject ]