generated
scan2
	self recordMatch: #(12).
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ] ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!) or: [ currentCharacter >= $# ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue ].
	^ self reportLastMatch