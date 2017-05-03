generated
scan10
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch