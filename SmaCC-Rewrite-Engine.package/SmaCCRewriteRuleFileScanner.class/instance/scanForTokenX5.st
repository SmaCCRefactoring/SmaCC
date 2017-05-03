generated
scanForTokenX5
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch