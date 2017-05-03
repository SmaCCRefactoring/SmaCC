generated
scanForTokenX15
	[ self recordMatch: #(86).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch