generated
scan1X11
	self recordMatch: #(40).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	^ self reportLastMatch