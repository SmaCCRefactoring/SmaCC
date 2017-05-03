private
outputSelectionIntervalFor: selection
	| source stop context match start |
	selection isNil
		ifTrue: [ ^ 1 to: 0 ].
	context := selection last receiver.
	source := context source.
	match := context match.
	start := context startIndexFor: match.
	stop := context stopIndexFor: match.
	^ (source stringIndexFor: start) to: (source stringIndexFor: stop)