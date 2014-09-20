generated
scan3
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(250) ] ] repeat