generated
scan38
	self recordMatch: #(71).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan13 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan39 ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch