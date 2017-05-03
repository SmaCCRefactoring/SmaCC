generated
scanForTokenX20
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(48) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self scanForTokenX19