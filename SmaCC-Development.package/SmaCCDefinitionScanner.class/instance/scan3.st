generated
scan3
	self recordMatch: #(27).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch