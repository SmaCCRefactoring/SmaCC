generated
scan1X20
	self recordMatch: #(27).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch