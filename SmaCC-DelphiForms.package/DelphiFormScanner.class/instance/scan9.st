generated
scan9
	self recordMatch: #(22).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch