generated
scan67
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan66 ] ] repeat