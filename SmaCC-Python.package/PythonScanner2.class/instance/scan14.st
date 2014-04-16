generated
scan14
	self recordMatch: #(77).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(77).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch