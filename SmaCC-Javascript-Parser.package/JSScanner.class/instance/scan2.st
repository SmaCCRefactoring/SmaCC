generated
scan2
	self recordMatch: #(86).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch