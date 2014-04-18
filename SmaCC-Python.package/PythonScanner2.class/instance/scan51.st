generated
scan51
	self recordMatch: #(77).
	self step.
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(72 77).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch