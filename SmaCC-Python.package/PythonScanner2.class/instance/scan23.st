generated
scan23
	self recordMatch: #(13).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan24 ].
	^ self reportLastMatch