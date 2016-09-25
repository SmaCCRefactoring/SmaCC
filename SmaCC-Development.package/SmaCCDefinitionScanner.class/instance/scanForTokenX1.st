generated
scanForTokenX1
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan6 ].
	^ self scanForTokenX1X6