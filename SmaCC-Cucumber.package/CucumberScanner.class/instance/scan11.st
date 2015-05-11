generated
scan11
	self step.
	currentCharacter = $a
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch