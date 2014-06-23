generated
scan19
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch