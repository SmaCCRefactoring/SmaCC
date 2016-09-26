generated
scanForTokenX8
	self recordMatch: #(7 26 32).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch