generated
scan35
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(167).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan35 ].
			^ self reportLastMatch ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(168).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan35 ].
			^ self reportLastMatch ].
	true ] whileTrue