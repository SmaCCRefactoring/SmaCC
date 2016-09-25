generated
scanForTokenX15
	[ self recordMatch: #(85).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch