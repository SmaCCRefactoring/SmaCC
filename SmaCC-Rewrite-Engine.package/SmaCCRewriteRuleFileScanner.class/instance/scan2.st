generated
scan2
	[ self step.
	currentCharacter == $!
		ifTrue: [ self recordMatch: #(16).
			self step.
			currentCharacter == $!
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	true ] whileTrue