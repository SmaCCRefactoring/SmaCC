generated
scan3
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch