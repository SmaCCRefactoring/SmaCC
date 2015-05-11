generated
scan6
	self step.
	currentCharacter = $n
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch