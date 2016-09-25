generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX19 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX18 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX11 ].
	^ self scanForTokenX23