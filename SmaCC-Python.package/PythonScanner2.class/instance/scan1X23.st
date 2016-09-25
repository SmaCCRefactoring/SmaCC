generated
scan1X23
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X20 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X8 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scan1X5 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scan1X14 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scan1X7 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan1X13 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	^ self scan1X22