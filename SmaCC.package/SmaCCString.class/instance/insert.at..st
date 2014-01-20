editing
insert: aString at: anInteger
	| newFirstInterval |
	aString isEmpty ifTrue: [^anInteger].
	(aString isKindOf: SmaCCString)
		ifTrue:
			[^aString
				copyFrom: aString startIndex
				to: aString stopIndex
				into: self
				at: anInteger]
		ifFalse:
			[newFirstInterval := self newIntervalFor: aString.
			^self
				insertFirst: newFirstInterval
				last: newFirstInterval
				at: anInteger]