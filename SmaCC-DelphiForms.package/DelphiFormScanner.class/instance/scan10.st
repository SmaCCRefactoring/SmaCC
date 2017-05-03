generated
scan10
	self recordMatch: #(22 24).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch