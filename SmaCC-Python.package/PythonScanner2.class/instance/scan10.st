generated
scan10
	self step.
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan13 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan12 ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch