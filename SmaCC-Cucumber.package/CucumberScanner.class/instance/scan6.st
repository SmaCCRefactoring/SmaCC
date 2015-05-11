generated
scan6
	self recordMatch: #(12).
	self step.
	currentCharacter = $`
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $`
				ifTrue: [ ^ self scan7 ] ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $_) or: [ currentCharacter >= $a ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(12).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue ].
	^ self reportLastMatch