generated
scanSplit31
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
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $e) or: [ currentCharacter between: $g and: $z ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			^ self scanSplitSeq30 ].
	currentCharacter = $x
		ifTrue: [ ^ self scanSplit18 ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $k)
								or: [ (currentCharacter between: $m and: $w) or: [ currentCharacter between: $y and: $z ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch