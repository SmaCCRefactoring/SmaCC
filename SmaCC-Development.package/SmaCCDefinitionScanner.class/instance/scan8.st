generated
scan8
	self recordMatch: #(35).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch