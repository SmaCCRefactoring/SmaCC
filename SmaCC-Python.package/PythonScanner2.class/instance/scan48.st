generated
scan48
	self recordMatch: #(77).
	self step.
	currentCharacter = $f
		ifTrue: [ 
			self recordMatch: #(45 77).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = $p
				ifTrue: [ 
					self recordMatch: #(77).
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self recordMatch: #(77).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(77).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(17 77).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
												ifTrue: [ ^ self scan34 ].
											^ self reportLastMatch ].
									((currentCharacter between: $0 and: $9)
										or: [ 
											(currentCharacter between: $A and: $Z)
												or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $s) or: [ currentCharacter between: $u and: $z ] ] ] ])
										ifTrue: [ ^ self scan34 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
								ifTrue: [ ^ self scan34 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $n) or: [ currentCharacter between: $p and: $z ] ] ] ])
						ifTrue: [ ^ self scan34 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $o) or: [ currentCharacter between: $q and: $z ] ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self recordMatch: #(29 77).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self recordMatch: #(54 77).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $e)
								or: [ 
									(currentCharacter between: $g and: $l)
										or: [ (currentCharacter between: $o and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch