generated
scan11X12
	self recordMatch: #(37).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	^ self scan1