generated
scan15
	[ 
	self recordMatch: #(75).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan14 ] ] repeat