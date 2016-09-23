generated
scan5
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit ] whileTrue.
			((currentCharacter between: $d and: $e)
				or: [ currentCharacter == $q ])
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch