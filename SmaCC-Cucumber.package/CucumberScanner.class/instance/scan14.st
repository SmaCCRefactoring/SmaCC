generated
scan14
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch