generated
scan22
	self recordMatch: #(2 10).
	self step.
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(2).
			self step.
			currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue ].
	^ self reportLastMatch