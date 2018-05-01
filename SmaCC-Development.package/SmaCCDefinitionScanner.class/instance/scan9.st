generated
scan9
	self step.
	currentCharacter == Character newPage
		ifTrue: [ ^ self scan9X7 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan9X10 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan9X4 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan9X2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self scan9X12