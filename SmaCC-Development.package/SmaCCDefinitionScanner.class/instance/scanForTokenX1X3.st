generated
scanForTokenX1X3
	self recordMatch: #(31).
	self step.
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	^ self reportLastMatch