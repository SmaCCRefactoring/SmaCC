generated
scanForTokenX15
	self recordMatch: #(44).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	^ self reportLastMatch