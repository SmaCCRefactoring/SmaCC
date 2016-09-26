generated
scanForTokenX2
	self recordMatch: #(27 32).
	self step.
	(currentCharacter isSeparator
		or: [ currentCharacter == Character null ])
		ifTrue: [ [ self recordMatch: #(27).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character null ] ] whileTrue ].
	^ self reportLastMatch