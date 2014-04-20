generated
scan51
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
					currentCharacter = $a
						ifTrue: [ 
							2
								timesRepeat: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $l
										ifFalse: [ 
											((currentCharacter between: $0 and: $9)
												or: [ 
													(currentCharacter between: $A and: $Z)
														or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ])
												ifTrue: [ ^ self scan38 ].
											^ self reportLastMatch ] ].
							self recordMatch: #(71).
							self step.
							currentCharacter = $y
								ifTrue: [ 
									self recordMatch: #(61 71).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
										ifTrue: [ ^ self scan38 ].
									^ self reportLastMatch ].
							((currentCharacter between: $0 and: $9)
								or: [ 
									(currentCharacter between: $A and: $Z)
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $x) or: [ currentCharacter = $z ] ] ] ])
								ifTrue: [ ^ self scan38 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $b and: $z ] ] ])
						ifTrue: [ ^ self scan38 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $m) or: [ currentCharacter between: $o and: $z ] ] ] ])
				ifTrue: [ ^ self scan38 ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(55 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan38 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
				ifTrue: [ ^ self scan38 ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $m
						ifTrue: [ 
							self recordMatch: #(12 71).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ ^ self scan38 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $l) or: [ currentCharacter between: $n and: $z ] ] ] ])
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
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $h)
								or: [ 
									(currentCharacter between: $j and: $n)
										or: [ (currentCharacter between: $p and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ] ])
		ifTrue: [ ^ self scan38 ].
	^ self reportLastMatch