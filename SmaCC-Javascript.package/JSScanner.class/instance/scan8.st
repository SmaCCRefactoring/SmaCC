generated
scan8
	self step.
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $\
				ifTrue: [ ^ self scan8 ].
			(currentCharacter <= Character newPage
				or: [ 
					(currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	^ self scan6