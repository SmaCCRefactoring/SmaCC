generated
scanForTokenX13
	[ self recordMatch: #(83).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch