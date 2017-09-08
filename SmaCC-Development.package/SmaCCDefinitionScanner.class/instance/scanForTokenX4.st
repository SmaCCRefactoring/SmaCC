generated
scanForTokenX4
	[ self recordMatch: #(29).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue