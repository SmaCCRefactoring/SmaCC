generated
scan1X11
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(76) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter == $^
		ifTrue: [ ^ self scan27 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan28 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter == $|
		ifTrue: [ ^ self scan29 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(155) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scan1X7 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue:
			[ self scan1X8 ].
	^ self reportLastMatch