generated
scan11
	self step.
	currentCharacter = $x
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch