generated
scan14
	self step.
	currentCharacter = $x
		ifTrue: [ ^ self scan15 ].
	^ self reportLastMatch