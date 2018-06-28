generated
scanForTokenX1X3
	[ self recordMatch: #(28).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch