generated
scan1
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter == Character cr
		ifTrue:
			[ ^ self scan1X19 ].
	^ self scan1X24