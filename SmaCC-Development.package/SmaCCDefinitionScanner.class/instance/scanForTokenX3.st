generated
scanForTokenX3
	[ self recordMatch: #(27).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch