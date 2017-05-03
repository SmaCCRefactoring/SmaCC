generated
scanForTokenX5
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self scanForTokenX4