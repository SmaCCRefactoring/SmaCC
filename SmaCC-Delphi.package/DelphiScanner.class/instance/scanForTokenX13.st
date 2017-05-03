generated
scanForTokenX13
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan15 ].
	currentCharacter == ${
		ifTrue: [ [ self step.
			currentCharacter == $}
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ])
		ifTrue:
			[ ^ self scanForTokenX4 ].
	(currentCharacter isSafeForHTTP
		or:
			[ 'ÄÖÜäöü' includes: currentCharacter ])
		ifTrue:
			[ self scanForTokenX2 ].
	^ self reportLastMatch