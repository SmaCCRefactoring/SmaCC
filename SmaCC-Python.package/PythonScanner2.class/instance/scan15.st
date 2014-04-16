generated
scan15
	self recordMatch: #(77).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(77).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch