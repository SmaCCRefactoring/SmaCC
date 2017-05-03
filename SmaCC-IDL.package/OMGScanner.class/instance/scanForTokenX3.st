generated
scanForTokenX3
	[ self recordMatch: #(62).
	self step.
	currentCharacter == $$
		or: [ (currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue