generated
scanForTokenX1X3
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan16 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $))
						or: [ (currentCharacter between: $+ and: $.)
								or: [ (currentCharacter between: $0 and: $<)
										or: [ (currentCharacter between: $> and: $Z)
												or: [ currentCharacter >= $] ] ] ] ] ] ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch