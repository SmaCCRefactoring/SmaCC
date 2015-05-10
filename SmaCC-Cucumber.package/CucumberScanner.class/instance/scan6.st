generated
scan6
	self recordMatch: #(14).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	^ self reportLastMatch