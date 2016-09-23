generated
scan6
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(24).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch