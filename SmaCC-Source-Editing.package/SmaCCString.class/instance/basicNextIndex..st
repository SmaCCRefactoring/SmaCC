accessing
basicNextIndex: anIndex
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex + 1.
	^ (interval containsIndex: newIndex)
		ifTrue: [ newIndex ]
		ifFalse:
			[ interval next isSentinel
				ifTrue: [ self stopIndex + 1 ]
				ifFalse: [ interval next startIndex ] ]