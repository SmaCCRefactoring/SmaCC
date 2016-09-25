generated
scan1
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(89) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch