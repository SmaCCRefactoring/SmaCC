generated
scanForTokenX1X5
	self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	^ self reportLastMatch