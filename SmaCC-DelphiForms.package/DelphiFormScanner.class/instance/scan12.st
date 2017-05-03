generated
scan12
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(26).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	true ] whileTrue