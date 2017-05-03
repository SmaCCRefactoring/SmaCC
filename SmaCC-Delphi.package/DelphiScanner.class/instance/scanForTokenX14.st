generated
scanForTokenX14
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(133) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(48) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	^ self scanForTokenX13