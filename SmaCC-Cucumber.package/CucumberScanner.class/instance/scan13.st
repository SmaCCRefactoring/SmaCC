generated
scan13
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch