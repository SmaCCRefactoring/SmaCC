generated
scan24
	self step.
	currentCharacter = $h
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch