generated
scan1X14
	self recordMatch: #(25).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	^ self reportLastMatch