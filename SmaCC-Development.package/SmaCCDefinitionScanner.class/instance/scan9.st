generated
scan9
	self recordMatch: #(35).
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch