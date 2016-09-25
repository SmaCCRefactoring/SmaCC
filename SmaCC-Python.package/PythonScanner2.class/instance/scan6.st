generated
scan6
	self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(72).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ ^ self scan8 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch