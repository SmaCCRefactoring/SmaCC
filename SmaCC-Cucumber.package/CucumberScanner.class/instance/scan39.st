generated
scan39
	[ 
	self recordMatch: #(16).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			[ 
			self recordMatch: #(16).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan34 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan43 ].
			currentCharacter = $! ] whileTrue.
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ])
				ifTrue: [ ^ self scan39 ].
			^ self reportLastMatch ].
	currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue.
	^ self reportLastMatch