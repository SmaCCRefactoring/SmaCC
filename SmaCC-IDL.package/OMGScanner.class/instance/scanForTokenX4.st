generated
scanForTokenX4
	self recordMatch: #(2).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $/
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch