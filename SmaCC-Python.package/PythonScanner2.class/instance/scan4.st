generated
scan4
	self recordMatch: #(77).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch