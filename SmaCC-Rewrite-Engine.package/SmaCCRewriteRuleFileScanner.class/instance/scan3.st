generated
scan3
	[self recordMatch: #(9).
	self step.
	currentCharacter == $.
		ifTrue:
			[self step.
			(currentCharacter isLetter or: [currentCharacter == $_]) ifTrue: [^self scan3].
			^self reportLastMatch].
	currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue.
	^self reportLastMatch