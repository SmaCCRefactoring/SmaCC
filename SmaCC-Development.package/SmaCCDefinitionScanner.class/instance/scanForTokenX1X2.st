generated
scanForTokenX1X2
	[ self recordMatch: #(27).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch