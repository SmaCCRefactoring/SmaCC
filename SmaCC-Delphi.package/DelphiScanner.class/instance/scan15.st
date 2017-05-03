generated
scan15
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(142).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan15 ].
			^ self reportLastMatch ].
	true ] whileTrue