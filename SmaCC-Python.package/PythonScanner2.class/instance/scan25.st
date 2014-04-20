generated
scan25
	self recordMatch: #(13).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan26 ].
	^ self reportLastMatch