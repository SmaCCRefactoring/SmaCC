generated
scan11
	[ self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan16 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch