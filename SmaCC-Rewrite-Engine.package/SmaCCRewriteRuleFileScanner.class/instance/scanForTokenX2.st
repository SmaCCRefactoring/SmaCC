generated
scanForTokenX2
	[ self recordMatch: #(12).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch