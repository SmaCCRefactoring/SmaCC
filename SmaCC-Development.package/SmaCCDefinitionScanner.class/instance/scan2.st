generated
scan2
	self recordMatch: #(27).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch