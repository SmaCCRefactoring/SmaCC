generated
scanForTokenX1X4
	[ self recordMatch: #(30).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue