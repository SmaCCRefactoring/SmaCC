generated
scan4
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch