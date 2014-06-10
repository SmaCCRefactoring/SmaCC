generated
scan23
	[ 
	self recordMatch: #(17).
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan24 ].
	currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue.
	^ self reportLastMatch