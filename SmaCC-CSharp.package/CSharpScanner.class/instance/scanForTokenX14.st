generated
scanForTokenX14
	self recordMatch: #(29).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(118) ].
	^ self reportLastMatch