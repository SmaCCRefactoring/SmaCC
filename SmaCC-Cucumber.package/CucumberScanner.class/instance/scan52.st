generated
scan52
	self recordMatch: #(1 9).
	self step.
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(1).
			self step.
			currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue ].
	^ self reportLastMatch