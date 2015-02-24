generated
scanSplit25
	self recordMatch: #(71).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $a
		ifTrue: [ ^ self scanSplit8 ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $t
				ifTrue: [ ^ self scanSplit7 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $s) or: [ currentCharacter between: $u and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $b and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	^ self reportLastMatch