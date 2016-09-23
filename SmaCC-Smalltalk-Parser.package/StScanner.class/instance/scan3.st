generated
scan3
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(29).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch