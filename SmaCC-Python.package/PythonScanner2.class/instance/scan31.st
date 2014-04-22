generated
scan31
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan30 ] ] repeat