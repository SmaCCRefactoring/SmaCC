generated
scanForTokenX6
	self recordMatch: #(26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch