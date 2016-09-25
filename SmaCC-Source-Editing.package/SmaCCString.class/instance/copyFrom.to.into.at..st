private
copyFrom: startIndex to: stopIndex into: aSmaCCString at: anInteger
	| startInterval stopInterval current newInterval first last |
	startInterval := self intervalContaining: startIndex.
	stopInterval := self intervalContaining: stopIndex.
	current := startInterval.
	last := first := nil.
	[ (current isRemoved or: [ current isSentinel ])
		ifFalse:
			[ newInterval := aSmaCCString newIntervalFor: current string.
			newInterval addAllAnnotations: current annotations.
			newInterval
				start:
					(current == startInterval
						ifTrue: [ self indexFor: startIndex ]
						ifFalse: [ current start ]).
			newInterval
				stop:
					(current == stopInterval
						ifTrue: [ self indexFor: stopIndex ]
						ifFalse: [ current stop ]).
			first isNil
				ifTrue: [ first := newInterval ].
			last notNil
				ifTrue: [ last next: newInterval ].
			last := newInterval ].
	current ~~ stopInterval ]
		whileTrue: [ current isSentinel
				ifTrue: [ ^ '' ].
			current := current next ].
	first isNil
		ifTrue: [ ^ aSmaCCString startIndex ].
	^ aSmaCCString insertFirst: first last: last at: anInteger