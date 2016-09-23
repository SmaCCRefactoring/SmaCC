generated
scanForTokenX12
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(17 32) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(19 32) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(16 32) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3 32) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(21 32) ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter isSpecial
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue:
			[ ^ self scanForTokenX6 ].
	^ self recordAndReportMatch: #(32)