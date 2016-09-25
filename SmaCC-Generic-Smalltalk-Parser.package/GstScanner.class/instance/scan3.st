generated
scan3
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(19).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	true ] whileTrue