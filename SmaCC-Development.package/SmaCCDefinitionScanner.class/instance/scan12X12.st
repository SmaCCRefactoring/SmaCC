generated
scan12X12
	self recordMatch: #(41).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch