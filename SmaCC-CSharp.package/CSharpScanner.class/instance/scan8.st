generated
scan8
	[self step.
	currentCharacter == $"
		ifTrue:
			[self recordMatch: #(158).
			self step.
			currentCharacter == $" ifTrue: [^self scan8].
			^self reportLastMatch]] repeat