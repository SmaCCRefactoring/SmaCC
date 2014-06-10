generated
scan18
	[ 
	self recordMatch: #(17).
	self step.
	currentCharacter = $! ] whileTrue.
	currentCharacter = $#
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $|
		ifTrue: [ ^ self scan29 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan14 ].
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							currentCharacter = $"
								or: [ (currentCharacter between: $$ and: $?) or: [ (currentCharacter between: $A and: ${) or: [ currentCharacter >= $} ] ] ] ] ] ])
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch