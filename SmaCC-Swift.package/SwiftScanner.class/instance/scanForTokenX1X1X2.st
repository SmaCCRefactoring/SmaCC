generated
scanForTokenX1X1X2
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter
						between: (Character value: 14)
						and: Character space)
						or: [ (currentCharacter between: $" and: $$)
								or: [ (currentCharacter between: $' and: $))
										or: [ currentCharacter == $,
												or: [ (currentCharacter between: $0 and: $;)
														or: [ (currentCharacter between: $? and: $])
																or: [ (currentCharacter between: $_ and: ${)
																		or: [ currentCharacter == $}
																				or: [ currentCharacter >= (Character value: 127) ] ] ] ] ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX1X1X1 ].
	^ self reportLastMatch