generated
scan19
	self step.
	currentCharacter = $i
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch