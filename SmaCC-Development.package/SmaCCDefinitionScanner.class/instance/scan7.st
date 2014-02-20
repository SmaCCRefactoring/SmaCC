generated
scan7
	self step.
	currentCharacter = $*
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch