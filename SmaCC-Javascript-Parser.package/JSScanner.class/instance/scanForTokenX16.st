generated
scanForTokenX16
	currentCharacter == $\
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan19 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan18 ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX15 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch