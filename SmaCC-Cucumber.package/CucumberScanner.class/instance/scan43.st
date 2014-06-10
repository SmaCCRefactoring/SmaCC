generated
scan43
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch