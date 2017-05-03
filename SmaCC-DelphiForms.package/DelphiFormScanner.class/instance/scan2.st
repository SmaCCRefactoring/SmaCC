generated
scan2
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	true ] whileTrue