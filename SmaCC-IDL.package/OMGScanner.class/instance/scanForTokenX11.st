generated
scanForTokenX11
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	^ self scanForTokenX10