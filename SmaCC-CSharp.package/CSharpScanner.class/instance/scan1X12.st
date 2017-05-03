generated
scan1X12
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X10 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X3 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan1X2 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan24 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scan1X6 ].
	currentCharacter == $?
		ifTrue: [ ^ self scan25 ].
	currentCharacter == $@
		ifTrue:
			[ ^ self scan1X5 ].
	^ self scan1X11