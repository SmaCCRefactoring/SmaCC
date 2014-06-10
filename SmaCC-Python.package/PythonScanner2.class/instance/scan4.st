generated
scan4
	self recordMatch: #(80).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch