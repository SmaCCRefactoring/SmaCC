generated
scan2
	self recordMatch: #(83).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch