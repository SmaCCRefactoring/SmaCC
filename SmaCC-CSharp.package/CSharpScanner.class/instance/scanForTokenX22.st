generated
scanForTokenX22
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan13 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX13 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue:
			[ self scanForTokenX20 ].
	^ self reportLastMatch