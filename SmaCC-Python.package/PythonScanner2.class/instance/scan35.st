generated
scan35
	self recordMatch: #(77).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan10 ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan36 ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch