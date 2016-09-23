generated
scanForTokenX1
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self scanForTokenX1X6