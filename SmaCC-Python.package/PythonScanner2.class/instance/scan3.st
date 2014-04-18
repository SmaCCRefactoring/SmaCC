generated
scan3
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan5 ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch