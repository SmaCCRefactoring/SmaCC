generated
scanForTokenX14
	self recordMatch: #(1).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	^ self reportLastMatch