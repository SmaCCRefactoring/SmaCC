private
includes: anObject
	^(anObject isKindOf: Character)
		ifTrue:
			[| index mask |
			index := anObject asInteger // 8 + 1.
			mask := 1 bitShift: anObject asInteger \\ 8.
			^((characters at: index) bitAnd: mask) = mask]
		ifFalse: [objects includes: anObject]