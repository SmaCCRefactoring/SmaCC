generated
scan26
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(169).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan26 ].
			^ self reportLastMatch ].
	true ] whileTrue