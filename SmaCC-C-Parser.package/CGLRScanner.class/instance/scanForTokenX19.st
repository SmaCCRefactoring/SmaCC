generated
scanForTokenX19
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ ^ self scan10 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter isSafeForHTTP
		ifTrue:
			[ self scanForTokenX4 ].
	^ self reportLastMatch