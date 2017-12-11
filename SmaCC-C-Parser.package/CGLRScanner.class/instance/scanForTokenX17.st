generated
scanForTokenX17
	self recordMatch: #(34).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch