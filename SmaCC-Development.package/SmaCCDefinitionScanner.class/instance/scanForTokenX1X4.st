generated
scanForTokenX1X4
	self recordMatch: #(32).
	self step.
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch