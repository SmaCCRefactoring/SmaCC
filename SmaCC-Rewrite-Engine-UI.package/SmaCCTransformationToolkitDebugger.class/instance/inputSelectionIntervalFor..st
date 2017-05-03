private
inputSelectionIntervalFor: selection
	^ selection isNil
		ifTrue: [ 1 to: 0 ]
		ifFalse: [ selection last receiver match startPosition to: selection last receiver match stopPosition ]