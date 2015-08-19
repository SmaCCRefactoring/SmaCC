generated
scan17
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan18 ].
	^ self reportLastMatch