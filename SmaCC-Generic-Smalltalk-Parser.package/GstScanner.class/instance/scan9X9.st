generated
scan9X9
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan9X7 ].
	currentCharacter == $1
		ifTrue:
			[ ^ self scan9X6 ].
	currentCharacter == $2
		ifTrue:
			[ ^ self scan9X5 ].
	currentCharacter == $3
		ifTrue:
			[ ^ self scan9X4 ].
	currentCharacter == $4
		ifTrue:
			[ ^ self scan9X3 ].
	currentCharacter == $5
		ifTrue:
			[ ^ self scan9X2 ].
	currentCharacter == $6
		ifTrue:
			[ ^ self scan9X1 ].
	currentCharacter == $r
		ifTrue:
			[ ^ self scan9X8 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch