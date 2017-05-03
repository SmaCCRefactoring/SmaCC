generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self scanForTokenX11