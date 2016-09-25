generated
scanForTokenX11
	[ self recordMatch: #(105).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch