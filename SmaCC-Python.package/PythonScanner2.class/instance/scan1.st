generated
scan1
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan3 ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch