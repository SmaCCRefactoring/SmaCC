generated
scanForTokenX14
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch