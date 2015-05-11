generated
scan23
	self step.
	currentCharacter = $h
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch