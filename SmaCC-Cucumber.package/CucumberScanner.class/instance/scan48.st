generated
scan48
	self step.
	currentCharacter = $h
		ifTrue: [ ^ self scan46 ].
	^ self reportLastMatch