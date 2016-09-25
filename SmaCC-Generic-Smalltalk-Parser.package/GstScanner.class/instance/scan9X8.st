generated
scan9X8
	self step.
	(currentCharacter between: $0 and: $2)
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter between: $0 and: $2 ] whileTrue ].
	^ self reportLastMatch