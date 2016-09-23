generated
scanForTokenX1X5
	self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	^ self reportLastMatch