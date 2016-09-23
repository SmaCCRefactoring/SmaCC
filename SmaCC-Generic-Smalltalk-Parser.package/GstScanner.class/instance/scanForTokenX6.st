generated
scanForTokenX6
	[ self recordMatch: #(18).
	self step.
	currentCharacter isSpecial ] whileTrue.
	^ self reportLastMatch