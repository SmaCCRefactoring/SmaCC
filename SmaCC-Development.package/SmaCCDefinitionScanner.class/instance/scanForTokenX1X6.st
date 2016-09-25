generated
scanForTokenX1X6
	currentCharacter == $:
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == ${
		ifTrue:
			[ ^ self scanForTokenX1X3 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $}
		ifTrue:
			[ ^ self scanForTokenX1X5 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue:
			[ self scanForTokenX1X4 ].
	^ self reportLastMatch