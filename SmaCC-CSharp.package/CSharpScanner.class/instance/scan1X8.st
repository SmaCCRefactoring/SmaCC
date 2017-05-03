generated
scan1X8
	[ self recordMatch: #(157).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue