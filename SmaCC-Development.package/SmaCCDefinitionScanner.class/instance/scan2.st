generated
scan2
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(30).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue