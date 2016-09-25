generated
scan1X1
	self step.
	currentCharacter == $x
		ifTrue: [ ^ self scan2 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ ^ self scan2 ] ] ].
			^ self reportLastMatch ].
	(('"''0\' includes: currentCharacter)
		or: [ (currentCharacter between: $a and: $b)
				or:
					[ 'fnrtv' includes: currentCharacter ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch