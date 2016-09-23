generated
scanForTokenX10
	self recordMatch: #(32).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	^ self scan1