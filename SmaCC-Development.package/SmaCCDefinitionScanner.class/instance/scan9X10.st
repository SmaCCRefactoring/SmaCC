generated
scan9X10
	self recordMatch: #(40).
	self step.
	currentCharacter ~~ $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch