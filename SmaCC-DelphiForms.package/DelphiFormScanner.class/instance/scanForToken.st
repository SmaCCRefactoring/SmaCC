generated
scanForToken
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan1 ].
	^ self scanForTokenX5