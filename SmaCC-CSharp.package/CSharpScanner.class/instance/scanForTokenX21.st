generated
scanForTokenX21
	self recordMatch: #(48).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch