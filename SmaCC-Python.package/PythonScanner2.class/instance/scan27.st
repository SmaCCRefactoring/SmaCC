generated
scan27
	self recordMatch: #(71).
	self step.
	currentCharacter = $a
		ifTrue: [ 
			2
				timesRepeat: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $s
						ifFalse: [ 
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(71).
									self step.
									(currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue ].
							^ self reportLastMatch ] ].
			self recordMatch: #(2 71).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(3 71).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
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
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $m) or: [ currentCharacter between: $o and: $z ] ] ] ])
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
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $h) or: [ currentCharacter between: $j and: $z ] ] ] ])
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
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $b and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch