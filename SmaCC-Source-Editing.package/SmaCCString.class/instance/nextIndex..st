accessing
nextIndex: anIndex
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex + 1.
	[(interval isRemoved not and: [interval containsIndex: newIndex])
		ifTrue: [^newIndex]
		ifFalse:
			[interval next isSentinel
				ifTrue: [^self stopIndex + 1]
				ifFalse:
					[interval := interval next.
					newIndex := interval startIndex]]] repeat