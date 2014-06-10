generated
scan7
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch