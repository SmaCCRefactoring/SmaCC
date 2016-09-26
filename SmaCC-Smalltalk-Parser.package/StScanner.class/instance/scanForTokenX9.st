generated
scanForTokenX9
	self recordMatch: #(6 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch