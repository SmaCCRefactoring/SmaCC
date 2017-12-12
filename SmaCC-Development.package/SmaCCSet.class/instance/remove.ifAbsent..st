removing
remove: oldObject ifAbsent: aBlock
	^ (oldObject isKindOf: Character)
		ifTrue: [ characters remove: oldObject ifAbsent: aBlock ]
		ifFalse: [ objects remove: oldObject ifAbsent: aBlock ]