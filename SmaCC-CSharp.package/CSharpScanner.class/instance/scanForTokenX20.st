generated
scanForTokenX20
	[ self recordMatch: #(154).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue