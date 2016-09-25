generated
scan12X5
	self recordMatch: #(30 41).
	self step.
	(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch