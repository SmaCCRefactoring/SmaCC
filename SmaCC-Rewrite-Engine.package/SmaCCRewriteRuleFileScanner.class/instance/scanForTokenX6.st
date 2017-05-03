generated
scanForTokenX6
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scanForTokenX5 ].
	^ self scan2