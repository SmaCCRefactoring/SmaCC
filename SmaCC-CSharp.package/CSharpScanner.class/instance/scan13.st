generated
scan13
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(161).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan13 ].
			^ self reportLastMatch ].
	true ] whileTrue