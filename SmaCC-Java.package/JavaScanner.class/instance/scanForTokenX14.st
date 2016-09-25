generated
scanForTokenX14
	self recordMatch: #(44).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(57) ].
	^ self reportLastMatch