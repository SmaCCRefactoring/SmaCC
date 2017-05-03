generated
scanForTokenX7
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch