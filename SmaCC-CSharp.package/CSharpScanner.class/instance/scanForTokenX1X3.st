generated
scanForTokenX1X3
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan30 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan24 ].
	currentCharacter == $>
		ifTrue: [ ^ self scan31 ].
	^ self scanForTokenX1X2