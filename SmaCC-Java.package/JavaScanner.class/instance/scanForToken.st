generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX16 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX15 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	^ self scanForTokenX19