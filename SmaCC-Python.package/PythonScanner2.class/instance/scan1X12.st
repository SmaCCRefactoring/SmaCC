generated
scan1X12
	self recordMatch: #(37).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	^ self reportLastMatch