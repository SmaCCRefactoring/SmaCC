compiling-scanner
actionForSpecificRegularExpression: aSmaCCRegularExpression 
	| matchedAction strings |
	strings := aSmaCCRegularExpression possibleMatches.
	matchedAction := self simulate: (ReadStream on: strings first).
	strings 
		do: [:each | matchedAction = (self simulate: (ReadStream on: each)) ifFalse: [^nil]].
	^matchedAction