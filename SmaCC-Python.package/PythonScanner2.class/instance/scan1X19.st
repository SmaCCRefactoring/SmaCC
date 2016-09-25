generated
scan1X19
	self recordMatch: #(80).
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	^ self reportLastMatch