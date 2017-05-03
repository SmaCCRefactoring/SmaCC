generated
scan1X10
	self recordMatch: #(49).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch