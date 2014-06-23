generated
scan5
	self step.
	currentCharacter = Character space
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch