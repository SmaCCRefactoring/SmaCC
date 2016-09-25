generated
scanForTokenX11
	self recordMatch: #(47).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	^ self reportLastMatch