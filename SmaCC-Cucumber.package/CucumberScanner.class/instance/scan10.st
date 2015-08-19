generated
scan10
	self step.
	currentCharacter = $n
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch