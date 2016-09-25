generated
scan6
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch