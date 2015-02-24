generated
scanSplitSeq28
	currentCharacter = $m
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $p
				ifTrue: [ ^ self scanSplit8 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $o) or: [ currentCharacter between: $q and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self recordMatch: #(36 71).
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
	currentCharacter = $s
		ifTrue: [ 
			self recordMatch: #(39 71).
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
				or: [ 
					currentCharacter = $_
						or: [ 
							(currentCharacter between: $a and: $e)
								or: [ 
									(currentCharacter between: $g and: $l)
										or: [ (currentCharacter between: $o and: $r) or: [ currentCharacter between: $t and: $z ] ] ] ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch