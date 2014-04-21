generated
scan29
	self recordMatch: #(71).
	self step.
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $y
				ifTrue: [ 
					self recordMatch: #(62 71).
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
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $x) or: [ currentCharacter = $z ] ] ] ])
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
	^ self reportLastMatch