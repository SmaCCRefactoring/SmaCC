generated
scan7
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(165).
			self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(166).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	true ] whileTrue