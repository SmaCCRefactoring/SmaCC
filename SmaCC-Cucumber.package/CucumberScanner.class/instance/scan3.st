generated
scan3
	[ 
	self recordMatch: #(17).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			[ 
			self recordMatch: #(17).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan2 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan4 ].
			currentCharacter = $! ] whileTrue.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue.
	^ self reportLastMatch