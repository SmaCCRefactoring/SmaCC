generated
scan2
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter = $\
		ifTrue: [ ^ self scan3 ].
	currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch