generated
scan10X1
	self recordMatch: #(86).
	self step.
	currentCharacter == $w
		ifTrue:
			[ ^ self scan10X1X1 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $v)
								or: [ currentCharacter between: $x and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch