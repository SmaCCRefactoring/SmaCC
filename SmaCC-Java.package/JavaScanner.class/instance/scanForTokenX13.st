generated
scanForTokenX13
	self recordMatch: #(2).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch