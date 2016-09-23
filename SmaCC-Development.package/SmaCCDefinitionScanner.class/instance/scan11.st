generated
scan11
	self step.
	currentCharacter == Character newPage
		ifTrue:
			[ ^ self scan11X5 ].
	currentCharacter == $"
		ifTrue:
			[ ^ self scan11X12 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scan11X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(32 37) ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scan11X8 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6 37) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3 37) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(5 37) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self scan11X13