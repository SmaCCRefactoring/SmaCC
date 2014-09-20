generated
scan67
	self step.
	currentCharacter = $6
		ifTrue: [ ^ self scan68 ].
	^ self reportLastMatch