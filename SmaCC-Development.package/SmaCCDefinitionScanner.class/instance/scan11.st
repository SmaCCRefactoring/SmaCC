generated
scan11
	self step.
	currentCharacter == Character newPage
		ifTrue: [ ^ self scan11X5 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan11X12 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan11X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(35 40) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan11X8 ].
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
		ifTrue: [ ^ self scan11X11 ].
	^ self scan11X13