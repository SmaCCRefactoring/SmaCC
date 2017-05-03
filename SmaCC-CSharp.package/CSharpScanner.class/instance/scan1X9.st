generated
scan1X9
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $@
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan7 ] ].
	^ self reportLastMatch