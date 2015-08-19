generated
scan12
	self step.
	currentCharacter = $a
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch