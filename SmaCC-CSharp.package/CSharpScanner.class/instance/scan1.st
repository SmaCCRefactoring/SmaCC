generated
scan1
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(158) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ currentCharacter >= $] ] ] ] ] whileTrue.
	^ self reportLastMatch