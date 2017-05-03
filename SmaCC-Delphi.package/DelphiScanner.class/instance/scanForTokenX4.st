generated
scanForTokenX4
	[ self recordMatch: #(141).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ] ] whileTrue.
	^ self reportLastMatch