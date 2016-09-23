generated
scanForTokenX5
	self recordMatch: #(17 18).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(18).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch