generated
scan9
	self recordMatch: #(86).
	self step.
	currentCharacter == $n
		ifTrue: [ ^ self scan10 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $m)
								or: [ currentCharacter between: $o and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch