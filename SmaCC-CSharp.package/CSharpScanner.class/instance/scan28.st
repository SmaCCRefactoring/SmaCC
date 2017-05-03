generated
scan28
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(172).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan28 ].
			^ self reportLastMatch ].
	true ] whileTrue