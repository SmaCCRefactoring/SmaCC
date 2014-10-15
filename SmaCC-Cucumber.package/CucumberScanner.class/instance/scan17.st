generated
scan17
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan15 ].
	^ self reportLastMatch