generated
scan8
	self recordMatch: #(31).
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch