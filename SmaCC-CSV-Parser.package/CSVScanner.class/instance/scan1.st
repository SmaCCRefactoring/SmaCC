generated
scan1
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue