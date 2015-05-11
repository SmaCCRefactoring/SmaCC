generated
scan8
	self step.
	currentCharacter = $a
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch