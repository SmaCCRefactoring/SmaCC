accessing
nextIndex: anIndex
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex + 1.
	[ (interval isRemoved not and: [ interval containsIndex: newIndex ])
		ifTrue: [ ^ newIndex ]
		ifFalse:
			[ interval := interval next.
			newIndex := interval startIndex.
			newIndex isNil
				ifTrue: [ ^ self stopIndex + 1 ] ] ] repeat