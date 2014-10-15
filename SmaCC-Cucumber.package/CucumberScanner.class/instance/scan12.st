generated
scan12
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch