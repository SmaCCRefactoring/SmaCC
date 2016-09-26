generated
scanForTokenX3
	self recordMatch: #(26 32).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch