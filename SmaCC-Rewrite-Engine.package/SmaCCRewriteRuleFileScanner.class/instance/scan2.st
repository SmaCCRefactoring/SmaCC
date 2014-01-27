generated
scan2
	[self step.
	currentCharacter == $"
		ifTrue:
			[self recordMatch: #(11).
			self step.
			currentCharacter == $" ifTrue: [^self scan2].
			^self reportLastMatch]] repeat