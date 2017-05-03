generated
scan10
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(108).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	true ] whileTrue