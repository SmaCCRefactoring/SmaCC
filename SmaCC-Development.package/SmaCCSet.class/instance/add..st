adding
add: newObject
	^ (newObject isKindOf: Character)
		ifTrue: [ characters add: newObject ]
		ifFalse: [ objects add: newObject ]