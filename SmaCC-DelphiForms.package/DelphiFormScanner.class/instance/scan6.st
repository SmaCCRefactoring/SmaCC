generated
scan6
	self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan6X1 ].
	('Dd' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(22 24).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			((currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $C)
		or: [ currentCharacter == $F
				or: [ (currentCharacter between: $a and: $c)
						or: [ currentCharacter == $f ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch