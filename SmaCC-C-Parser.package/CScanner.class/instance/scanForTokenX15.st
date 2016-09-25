generated
scanForTokenX15
	self recordMatch: #(17).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self reportLastMatch