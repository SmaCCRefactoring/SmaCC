generated
scan7
	self recordMatch: #(87).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch