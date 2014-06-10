generated
scan65
	self recordMatch: #(75).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	^ self reportLastMatch