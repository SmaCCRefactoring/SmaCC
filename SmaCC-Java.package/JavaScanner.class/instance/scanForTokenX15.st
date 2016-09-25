generated
scanForTokenX15
	self recordMatch: #(89).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(67) ].
	^ self reportLastMatch