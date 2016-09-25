generated
scan2
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(10).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	true ] whileTrue