generated
scan11
	self recordMatch: #(20).
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ self recordMatch: #(20 24).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan11 ] ].
	((currentCharacter between: $G and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $g and: $z)
						or: [ 'ÄÖÜäöü' includes: currentCharacter ] ] ])
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $z)
										or: [ 'ÄÖÜäöü' includes: currentCharacter ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch