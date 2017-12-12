generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX18 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX10 ].
	^ self scanForTokenX20