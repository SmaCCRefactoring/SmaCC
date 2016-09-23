generated
scan11X3
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan13 ].
	(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch