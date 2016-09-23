editing
append: aString
	| position newInterval str |
	aString isEmpty
		ifTrue: [ ^ self stopIndex ].
	str := (aString isKindOf: SmaCCString)
		ifTrue: [ aString ]
		ifFalse: [ SmaCCString on: aString ].
	str
		intervalsDo:
			[ :each | 
			newInterval := self newIntervalFor: each string.
			newInterval addAllAnnotations: each annotations.
			newInterval start: each start.
			newInterval stop: each stop.
			position isNil
				ifTrue: [ position := newInterval startIndex ].
			newInterval previous: lastSentinel previous.
			newInterval next: lastSentinel.
			newInterval previous next: newInterval.
			lastSentinel previous: newInterval ].
	^ position