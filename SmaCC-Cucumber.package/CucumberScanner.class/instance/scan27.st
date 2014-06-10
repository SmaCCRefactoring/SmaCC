generated
scan27
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch