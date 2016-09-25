generated
scanForTokenX4
	[ self recordMatch: #(30).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue