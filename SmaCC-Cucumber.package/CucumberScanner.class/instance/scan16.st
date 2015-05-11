generated
scan16
	self step.
	currentCharacter = $v
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch