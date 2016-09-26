generated
scanForTokenX7
	self recordMatch: #(9 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch