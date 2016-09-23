generated
scanForTokenX18
	self recordMatch: #(4).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(119) ].
	^ self reportLastMatch