generated
scan11X10
	self recordMatch: #(34 40).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch