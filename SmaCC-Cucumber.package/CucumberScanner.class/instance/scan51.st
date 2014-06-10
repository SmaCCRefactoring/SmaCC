generated
scan51
	self step.
	currentCharacter = $|
		ifTrue: [ ^ self scan52 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
		ifTrue: [ ^ self scan1 ].
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $! and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $|
				ifTrue: [ ^ self scan52 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space or: [ currentCharacter = $@ ] ])
				ifTrue: [ ^ self scan1 ].
			currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch