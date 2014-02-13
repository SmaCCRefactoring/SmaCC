generated
scan8
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch