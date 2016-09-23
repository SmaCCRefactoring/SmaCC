generated
scanForTokenX14
	self recordMatch: #(40).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch