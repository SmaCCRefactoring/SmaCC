generated
scan60
	self recordMatch: #(71).
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self recordMatch: #(71).
							self step.
							currentCharacter = $d
								ifTrue: [ 
									self recordMatch: #(11 71).
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
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ])
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
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $h) or: [ currentCharacter between: $j and: $z ] ] ] ])
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch