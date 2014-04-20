generated
scan52
	self recordMatch: #(71).
	self step.
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $b
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self recordMatch: #(27 71).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
												ifTrue: [ ^ self scan38 ].
											^ self reportLastMatch ].
									((currentCharacter between: $0 and: $9)
										or: [ 
											(currentCharacter between: $A and: $Z)
												or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ])
										ifTrue: [ ^ self scan38 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
								ifTrue: [ ^ self scan38 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ ('_a' includes: currentCharacter) or: [ currentCharacter between: $c and: $z ] ] ])
						ifTrue: [ ^ self scan38 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $n) or: [ currentCharacter between: $p and: $z ] ] ] ])
				ifTrue: [ ^ self scan38 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ])
		ifTrue: [ ^ self scan38 ].
	^ self reportLastMatch