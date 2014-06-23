generated
scan4
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch