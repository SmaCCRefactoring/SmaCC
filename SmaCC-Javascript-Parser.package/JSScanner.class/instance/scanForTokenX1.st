generated
scanForTokenX1
	self recordMatch: #(81).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan17 ].
	^ self scanForTokenX1X3