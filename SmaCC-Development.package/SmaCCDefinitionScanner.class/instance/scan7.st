generated
scan7
	self recordMatch: #(34).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch