generated
scan1
	self recordMatch: #(15).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	^ self reportLastMatch