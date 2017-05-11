generated
scanForTokenX1X5
	self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch