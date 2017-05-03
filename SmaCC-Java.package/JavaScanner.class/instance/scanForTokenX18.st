generated
scanForTokenX18
	[ self recordMatch: #(105).
	self step.
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue