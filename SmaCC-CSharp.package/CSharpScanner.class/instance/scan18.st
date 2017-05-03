generated
scan18
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch