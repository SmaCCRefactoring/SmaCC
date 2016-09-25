generated
scan12X3
	self recordMatch: #(7).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan14 ].
	(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch