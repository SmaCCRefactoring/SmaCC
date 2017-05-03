generated
scanForTokenX12
	self recordMatch: #(61).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch