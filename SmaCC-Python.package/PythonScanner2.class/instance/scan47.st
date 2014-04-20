generated
scan47
	self recordMatch: #(71).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $R
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan14 ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $k
								ifTrue: [ 
									self recordMatch: #(7 71).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
										ifTrue: [ ^ self scan38 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $j) or: [ currentCharacter between: $l and: $z ] ] ] ])
								ifTrue: [ ^ self scan38 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
						ifTrue: [ ^ self scan38 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
				ifTrue: [ ^ self scan38 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan38 ].
	^ self reportLastMatch