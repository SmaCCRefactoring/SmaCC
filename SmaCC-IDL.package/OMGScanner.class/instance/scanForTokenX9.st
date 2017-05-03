generated
scanForTokenX9
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch