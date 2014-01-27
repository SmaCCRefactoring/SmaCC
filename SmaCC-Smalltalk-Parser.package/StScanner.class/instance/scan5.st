generated
scan5
	[self step.
	currentCharacter == $:
		ifTrue:
			[self recordMatch: #(25).
			self step.
			(currentCharacter isLetter or: [currentCharacter == $_]) ifTrue: [^self scan5].
			^self reportLastMatch].
	currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue.
	^self reportLastMatch