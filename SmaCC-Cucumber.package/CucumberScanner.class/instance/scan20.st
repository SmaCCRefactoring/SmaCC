generated
scan20
	self step.
	currentCharacter = $h
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch