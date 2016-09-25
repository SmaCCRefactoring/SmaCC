generated
scan12X13
	self recordMatch: #(41).
	self step.
	currentCharacter ~~ $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch