generated
scan7
	self recordMatch: #(31).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch