accessing
previousIndex: anIndex
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex - 1.
	[ (interval isRemoved not
		and:
			[ (interval containsIndex: newIndex)
				and: [ (self indexFor: newIndex) ~= 0 ] ])
		ifTrue: [ ^ newIndex ]
		ifFalse:
			[ interval previous isSentinel
				ifTrue: [ ^ nil ]
				ifFalse: [ interval := interval previous.
					newIndex := interval stopIndex ] ] ] repeat