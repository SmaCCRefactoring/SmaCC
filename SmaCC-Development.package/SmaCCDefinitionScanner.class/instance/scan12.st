generated
scan12
	self step.
	currentCharacter == Character newPage
		ifTrue: [ ^ self scan12X6 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan12X13 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan12X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan12X10 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan12X8 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(5 41) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(2 41) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(1 41) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan12X12 ].
	^ self scan12X14