generated
scan8X11
	self step.
	(currentCharacter between: $0 and: $1)
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter between: $0 and: $1 ] whileTrue ].
	^ self reportLastMatch