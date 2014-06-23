generated
scan18
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch