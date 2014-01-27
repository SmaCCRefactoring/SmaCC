generated
scan9
	[self step.
	currentCharacter == $`
		ifTrue:
			[self recordMatch: #(161).
			self step.
			currentCharacter == $` ifTrue: [^self scan9].
			^self reportLastMatch]] repeat