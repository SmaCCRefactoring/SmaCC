generated
scan45
	self recordMatch: #(71).
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $d
				ifTrue: [ 
					self recordMatch: #(70 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $c) or: [ currentCharacter between: $e and: $z ] ] ] ])
				ifTrue: [ ^ self scan37 ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self recordMatch: #(10 71).
			self step.
			currentCharacter = $s
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(41 71).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
												ifTrue: [ ^ self scan37 ].
											^ self reportLastMatch ].
									((currentCharacter between: $0 and: $9)
										or: [ 
											(currentCharacter between: $A and: $Z)
												or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $s) or: [ currentCharacter between: $u and: $z ] ] ] ])
										ifTrue: [ ^ self scan37 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
								ifTrue: [ ^ self scan37 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ])
				ifTrue: [ ^ self scan37 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $m)
								or: [ (currentCharacter between: $o and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch