generated
scanForTokenX17
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	^ self scanForTokenX16