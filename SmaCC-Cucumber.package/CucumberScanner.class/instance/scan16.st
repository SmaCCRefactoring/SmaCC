generated
scan16
	self step.
	currentCharacter = $e
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch