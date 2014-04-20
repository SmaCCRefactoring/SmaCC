generated
scan39
	self recordMatch: #(71).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan14 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan40 ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan38 ].
	^ self reportLastMatch