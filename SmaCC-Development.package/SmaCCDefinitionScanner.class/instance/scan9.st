generated
scan9
	self step.
	currentCharacter == Character newPage
		ifTrue: [ ^ self scan9X5 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan9X10 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan9X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan9X7 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9 40) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(1 40) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4 40) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan9X9 ].
	^ self scan9X11