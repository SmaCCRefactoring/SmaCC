generated
scanForTokenX13
	self recordMatch: #(3).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(68) ].
	^ self reportLastMatch