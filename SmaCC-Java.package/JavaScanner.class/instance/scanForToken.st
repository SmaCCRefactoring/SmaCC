generated
scanForToken
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX16 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX15 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self scanForTokenX20