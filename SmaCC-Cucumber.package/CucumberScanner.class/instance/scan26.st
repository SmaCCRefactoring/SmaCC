generated
scan26
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch