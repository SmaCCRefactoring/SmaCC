generated
scan7
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(72) ].
	currentCharacter = $\
		ifTrue: [ ^ self scan8 ].
	currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch