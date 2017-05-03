generated
scan5
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch