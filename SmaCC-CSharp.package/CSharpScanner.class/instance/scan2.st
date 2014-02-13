generated
scan2
	self step.
	currentCharacter isHexDigit
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch