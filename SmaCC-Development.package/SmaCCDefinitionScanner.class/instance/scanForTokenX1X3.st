generated
scanForTokenX1X3
	self recordMatch: #(29).
	self step.
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	^ self reportLastMatch