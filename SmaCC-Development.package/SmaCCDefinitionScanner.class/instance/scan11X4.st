generated
scan11X4
	self recordMatch: #(26 37).
	self step.
	(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch