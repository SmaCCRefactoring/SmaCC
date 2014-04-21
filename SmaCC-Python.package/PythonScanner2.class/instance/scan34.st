generated
scan34
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(75) ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan33 ] ] repeat