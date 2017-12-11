generated
scanForTokenX18
	self recordMatch: #(32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	^ self reportLastMatch