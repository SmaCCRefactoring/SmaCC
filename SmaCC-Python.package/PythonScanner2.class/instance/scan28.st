generated
scan28
	self recordMatch: #(71).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $a
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self recordMatch: #(14 71).
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
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
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
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ])
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
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self recordMatch: #(17 71).
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
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
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
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $t) or: [ currentCharacter between: $v and: $z ] ] ] ])
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
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $b and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch