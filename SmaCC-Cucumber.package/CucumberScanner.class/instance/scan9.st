generated
scan9
	self step.
	currentCharacter = $n
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch