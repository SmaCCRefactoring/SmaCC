generated
scan49
	self recordMatch: #(71).
	self step.
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self recordMatch: #(60 71).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ ^ self scan37 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $e) or: [ currentCharacter between: $g and: $z ] ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(57 71).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
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
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $h)
										or: [ (currentCharacter between: $j and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ] ])
				ifTrue: [ ^ self scan37 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $p
								ifTrue: [ 
									self recordMatch: #(71).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(64 71).
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
										or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $o) or: [ currentCharacter between: $q and: $z ] ] ] ])
								ifTrue: [ ^ self scan37 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self recordMatch: #(18 71).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ ^ self scan37 ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $b) or: [ currentCharacter between: $d and: $z ] ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ (currentCharacter between: $a and: $b) or: [ currentCharacter = $d or: [ currentCharacter between: $f and: $z ] ] ] ] ])
				ifTrue: [ ^ self scan37 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $k)
								or: [ (currentCharacter between: $m and: $w) or: [ currentCharacter between: $y and: $z ] ] ] ] ])
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch