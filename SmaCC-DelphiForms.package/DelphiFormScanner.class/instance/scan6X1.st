generated
scan6X1
	self recordMatch: #(21 24).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	('Dd' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(22).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan10 ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			((currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $C)
		or: [ currentCharacter == $F
				or: [ (currentCharacter between: $a and: $c)
						or: [ currentCharacter == $f ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch