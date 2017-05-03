generated
scan1
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scan1X4 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scan1X9 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan12 ].
	^ self scan1X12