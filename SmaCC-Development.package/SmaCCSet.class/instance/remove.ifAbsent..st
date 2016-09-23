removing
remove: oldObject ifAbsent: aBlock
	(oldObject isKindOf: Character)
		ifTrue:
			[ | index mask |
			index := oldObject asInteger // 8 + 1.
			mask := 1 bitShift: oldObject asInteger \\ 8.
			((characters at: index) bitAnd: mask) = mask
				ifTrue:
					[ characters at: index put: ((characters at: index) bitXor: mask).
					^ oldObject ]
				ifFalse: [ ^ aBlock value ] ]
		ifFalse: [ ^ objects remove: oldObject ifAbsent: aBlock ]