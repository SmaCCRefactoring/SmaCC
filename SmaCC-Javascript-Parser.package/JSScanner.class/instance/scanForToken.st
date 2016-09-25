generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX7 ].
	^ self scanForTokenX17