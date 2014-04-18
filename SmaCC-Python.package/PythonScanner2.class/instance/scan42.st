generated
scan42
	self recordMatch: #(77).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $R
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan10 ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(77).
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self recordMatch: #(77).
							self step.
							currentCharacter = $k
								ifTrue: [ 
									self recordMatch: #(5 77).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
										ifTrue: [ ^ self scan34 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $j) or: [ currentCharacter between: $l and: $z ] ] ] ])
								ifTrue: [ ^ self scan34 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
						ifTrue: [ ^ self scan34 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Q)
				or: [ 
					(currentCharacter between: $S and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch