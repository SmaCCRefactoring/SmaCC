generated
scan16
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(26).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	true ] whileTrue