adding
add: newObject
	^ (newObject isKindOf: Character)
		ifTrue:
			[ | index mask |
			index := newObject asInteger // 8 + 1.
			mask := 1 bitShift: newObject asInteger \\ 8.
			characters at: index put: ((characters at: index) bitOr: mask).
			newObject ]
		ifFalse: [ objects add: newObject ]