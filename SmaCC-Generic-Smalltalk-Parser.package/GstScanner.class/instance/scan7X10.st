generated
scan7X10
	self step.
	(currentCharacter isDigit
		or: [ currentCharacter between: $A and: $I ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter isDigit
				or: [ currentCharacter between: $A and: $I ] ] whileTrue ].
	^ self reportLastMatch