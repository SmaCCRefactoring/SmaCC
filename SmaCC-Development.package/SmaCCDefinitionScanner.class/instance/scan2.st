generated
scan2
	self recordMatch: #(31).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch