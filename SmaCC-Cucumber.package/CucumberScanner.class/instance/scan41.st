generated
scan41
	self step.
	currentCharacter = Character space
		ifTrue: [ ^ self scan42 ].
	^ self reportLastMatch