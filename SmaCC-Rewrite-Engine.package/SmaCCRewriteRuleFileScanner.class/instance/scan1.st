generated
scan1
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(15).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue