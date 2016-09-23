generated
scanForTokenX4
	[ self recordMatch: #(26).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue