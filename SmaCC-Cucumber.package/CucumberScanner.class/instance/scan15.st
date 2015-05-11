generated
scan15
	self step.
	currentCharacter = $i
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch