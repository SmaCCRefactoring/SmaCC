generated
scan12
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch