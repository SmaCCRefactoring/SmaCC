generated
scan18
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch