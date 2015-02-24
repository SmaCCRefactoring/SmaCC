generated
scanSplitSeq26
	currentCharacter = $n
		ifTrue: [ ^ self scanSplit21 ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(68 71).
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
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ ^ self scanSplit17 ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan5 ].
			currentCharacter = $a
				ifTrue: [ ^ self scanSplit6 ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $t
						ifTrue: [ ^ self scanSplit5 ].
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
			^ self reportLastMatch ].
	^ self scanSplitSeq25