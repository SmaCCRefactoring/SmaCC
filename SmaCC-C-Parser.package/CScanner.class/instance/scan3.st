generated
scan3
	[ self step.
	currentCharacter == $'
		ifTrue: [ [ self recordMatch: #(77).
			self step.
			currentCharacter == $' ] whileTrue.
			currentCharacter == $\
				ifTrue: [ ^ self scan4 ].
			(currentCharacter <= $!
				or: [ (currentCharacter between: $# and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $&)
				or: [ (currentCharacter between: $( and: $[)
						or: [ currentCharacter >= $] ] ] ] ] whileTrue.
	^ self reportLastMatch