generated
scanForTokenX1X2
	[ self recordMatch: #(26).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch