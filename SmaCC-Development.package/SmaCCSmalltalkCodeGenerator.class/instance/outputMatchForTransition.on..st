compiling-scanner
outputMatchForTransition: each on: stream
	each first = each last
		ifTrue: [ ^ self outputSingleCharacterMatch: each on: stream ].
	each first = (Character value: 0)
		ifTrue: [ ^ self outputLessThanMatch: each on: stream ].
	each last = (Character value: SmaCCGrammar maximumCharacterValue)
		ifTrue: [ ^ self outputGreaterThanMatch: each on: stream ].
	self outputRangeMatch: each on: stream