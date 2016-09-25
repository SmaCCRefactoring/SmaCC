generated
scan8X12
	currentCharacter == $1
		ifTrue:
			[ ^ self scan8X9 ].
	currentCharacter == $2
		ifTrue:
			[ ^ self scan8X8 ].
	currentCharacter == $3
		ifTrue:
			[ ^ self scan8X7 ].
	currentCharacter == $4
		ifTrue:
			[ ^ self scan8X6 ].
	currentCharacter == $5
		ifTrue:
			[ ^ self scan8X5 ].
	currentCharacter == $6
		ifTrue:
			[ ^ self scan8X4 ].
	currentCharacter == $7
		ifTrue:
			[ ^ self scan8X3 ].
	currentCharacter == $8
		ifTrue:
			[ ^ self scan8X2 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan8X1 ].
	currentCharacter == $r
		ifTrue:
			[ ^ self scan8X11 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch