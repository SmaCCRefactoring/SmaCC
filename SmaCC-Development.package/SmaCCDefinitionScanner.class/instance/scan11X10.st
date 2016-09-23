generated
scan11X10
	self recordMatch: #(31 37).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch