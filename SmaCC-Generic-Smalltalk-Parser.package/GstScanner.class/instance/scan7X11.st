generated
scan7X11
	currentCharacter == $4
		ifTrue:
			[ ^ self scan7X5 ].
	currentCharacter == $5
		ifTrue:
			[ ^ self scan7X4 ].
	currentCharacter == $6
		ifTrue:
			[ ^ self scan7X3 ].
	currentCharacter == $7
		ifTrue:
			[ ^ self scan7X2 ].
	currentCharacter == $8
		ifTrue:
			[ ^ self scan7X1 ].
	currentCharacter isDigit
		ifTrue: [ self recordMatch: #(25).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $r
				ifTrue:
					[ ^ self scan7X10 ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ] ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch