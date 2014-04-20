generated
scan14
	self step.
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan17 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan16 ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan15 ].
	^ self reportLastMatch