generated
scan49
	self recordMatch: #(77).
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self recordMatch: #(77).
					self step.
					currentCharacter = $b
						ifTrue: [ 
							self recordMatch: #(77).
							self step.
							currentCharacter = $d
								ifTrue: [ 
									self recordMatch: #(77).
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self recordMatch: #(68 77).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
												ifTrue: [ ^ self scan34 ].
											^ self reportLastMatch ].
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
										ifTrue: [ ^ self scan34 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $c) or: [ currentCharacter between: $e and: $z ] ] ] ])
								ifTrue: [ ^ self scan34 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ ('_a' includes: currentCharacter) or: [ currentCharacter between: $c and: $z ] ] ])
						ifTrue: [ ^ self scan34 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $l) or: [ currentCharacter between: $n and: $z ] ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch