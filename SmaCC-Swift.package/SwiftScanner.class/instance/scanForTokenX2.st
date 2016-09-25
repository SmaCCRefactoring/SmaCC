generated
scanForTokenX2
	self recordMatch: #(87 88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $b
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					(currentCharacter between: $0 and: $1)
						or: [ currentCharacter == $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $o
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					(currentCharacter between: $0 and: $7)
						or: [ currentCharacter == $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $x
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					currentCharacter == $.
						ifTrue: [ [ self step.
							('Pp' includes: currentCharacter)
								ifTrue: [ ^ self scan7 ].
							currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $f ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					('Pp' includes: currentCharacter)
						ifTrue: [ ^ self scan7 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $f ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan7 ].
	(currentCharacter isDigit or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch