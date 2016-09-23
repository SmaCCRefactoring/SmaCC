generated
scanForTokenX18
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan10 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(88) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX11 ].
	(currentCharacter isLetter
		or: [ currentCharacter isSafeForHTTP or: [ currentCharacter == $$ ] ])
		ifTrue:
			[ self scanForTokenX17 ].
	^ self reportLastMatch