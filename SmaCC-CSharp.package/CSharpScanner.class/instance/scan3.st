generated
scan3
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan3X1 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ currentCharacter >= $] ] ] ] ] whileTrue.
	^ self reportLastMatch