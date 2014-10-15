generated
scan19
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan18 ].
	^ self reportLastMatch