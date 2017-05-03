generated
scanForTokenX11
	self recordMatch: #(8).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	^ self reportLastMatch