generated
scanForTokenX12
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX8 ].
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
			[ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(21 32) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character null ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter isSpecial
		ifTrue:
			[ ^ self scanForTokenX6 ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue:
			[ ^ self scanForTokenX1 ].
	^ self recordAndReportMatch: #(32)