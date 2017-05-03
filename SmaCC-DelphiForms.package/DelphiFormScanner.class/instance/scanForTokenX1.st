generated
scanForTokenX1
	[ self recordMatch: #(20).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or:
									[ 'ÄÖÜäöü' includes: currentCharacter ] ] ] ] ] whileTrue