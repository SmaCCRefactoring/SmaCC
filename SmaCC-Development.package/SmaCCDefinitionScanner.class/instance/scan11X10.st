generated
scan11X10
	self recordMatch: #(33 39).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch