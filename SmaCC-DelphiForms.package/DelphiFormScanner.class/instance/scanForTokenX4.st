generated
scanForTokenX4
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $`
		ifTrue: [ ^ self scan12 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX3 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan11 ].
	(currentCharacter isSafeForHTTP
		or:
			[ 'ÄÖÜäöü' includes: currentCharacter ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch