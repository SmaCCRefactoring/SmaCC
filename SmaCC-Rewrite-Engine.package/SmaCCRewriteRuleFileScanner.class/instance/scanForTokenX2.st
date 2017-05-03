generated
scanForTokenX2
	[ self recordMatch: #(17).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch