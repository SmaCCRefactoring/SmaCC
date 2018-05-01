generated
scanForTokenX1
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	^ self scanForTokenX1X7