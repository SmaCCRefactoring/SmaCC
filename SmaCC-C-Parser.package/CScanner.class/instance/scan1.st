generated
scan1
	self step.
	currentCharacter == $\ ifTrue: [^self scan3].
	(currentCharacter <= $! or: [(currentCharacter between: $# and: $[) or: [currentCharacter >= $]]])
		ifTrue: [^self scan2].
	^self reportLastMatch