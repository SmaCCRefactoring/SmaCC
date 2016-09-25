generated
scanForTokenX17
	[ self recordMatch: #(104).
	self step.
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue