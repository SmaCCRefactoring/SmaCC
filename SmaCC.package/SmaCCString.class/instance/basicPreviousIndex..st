accessing
basicPreviousIndex: anIndex
	| interval newIndex |
	interval := self intervalContaining: anIndex.
	newIndex := anIndex - 1.
	^((interval containsIndex: newIndex) and: [(self indexFor: newIndex) ~= 0])
		ifTrue: [newIndex]
		ifFalse: [interval previous isSentinel ifTrue: [nil] ifFalse: [interval previous stopIndex]]