generated
scan24
	[ 
	self recordMatch: #(17).
	self step.
	currentCharacter = $! ] whileTrue.
	currentCharacter = $#
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan22 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan20 ].
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ currentCharacter = $" or: [ (currentCharacter between: $$ and: $?) or: [ currentCharacter >= $A ] ] ] ] ])
		ifTrue: [ ^ self scan23 ].
	^ self reportLastMatch