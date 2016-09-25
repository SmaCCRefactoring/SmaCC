generated
scan1X24
	currentCharacter == $!
		ifTrue:
			[ ^ self scan1X21 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scan1X6 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scan1X18 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scan1X17 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scan1X9 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scan1X16 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scan1X15 ].
	^ self scan1X23