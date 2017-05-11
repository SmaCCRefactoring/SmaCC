generated
scanForTokenX3
	[ self recordMatch: #(26).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch