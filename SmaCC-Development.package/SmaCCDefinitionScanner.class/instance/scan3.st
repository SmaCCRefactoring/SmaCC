generated
scan3
	self recordMatch: #(31).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch