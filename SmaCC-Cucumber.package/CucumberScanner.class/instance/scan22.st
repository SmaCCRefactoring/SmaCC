generated
scan22
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self scan23 ].
	^ self reportLastMatch