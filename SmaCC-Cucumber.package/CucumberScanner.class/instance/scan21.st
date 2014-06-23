generated
scan21
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch