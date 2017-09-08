generated
scanForTokenX1X3
	self recordMatch: #(32).
	self step.
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch