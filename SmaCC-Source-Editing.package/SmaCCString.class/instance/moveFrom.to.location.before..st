editing
moveFrom: fromIndex to: toIndex location: newIndex before: aBoolean
	| startInterval stopInterval newInterval currentInterval afterInterval |
	startInterval := self intervalContaining: fromIndex.
	startInterval := startInterval splitAt: (self indexFor: fromIndex).
	currentInterval := startInterval.
	[ currentInterval containsIndex: toIndex ]
		whileFalse:
			[ currentInterval isSentinel
				ifTrue: [ ^ self ].
			(currentInterval containsIndex: newIndex)
				ifTrue: [ ^ self ].
			currentInterval := currentInterval next ].
	stopInterval := currentInterval.
	(stopInterval containsIndex: newIndex)
		ifTrue: [ newIndex < toIndex
				ifTrue: [ ^ self ] ].
	stopInterval := (stopInterval splitAt: (self indexFor: toIndex) + 1)
		previous.
	newInterval := self intervalContaining: newIndex.
	afterInterval := aBoolean
		ifTrue: [ newInterval splitAt: (self indexFor: newIndex) ]
		ifFalse:
			[ (newInterval containsIndex: newIndex)
				ifTrue: [ newInterval splitAt: (self indexFor: newIndex) + 1 ]
				ifFalse: [ newInterval next ] ].
	startInterval previous next: stopInterval next.
	afterInterval previous next: startInterval.
	stopInterval next: afterInterval