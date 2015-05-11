generated
scan18
	self step.
	currentCharacter = $i
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch