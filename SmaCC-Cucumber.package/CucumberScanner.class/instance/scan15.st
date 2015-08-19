generated
scan15
	self step.
	currentCharacter = $x
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch