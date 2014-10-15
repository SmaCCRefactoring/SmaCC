generated
scan16
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch