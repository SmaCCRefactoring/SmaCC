generated
scan36
	self recordMatch: #(77).
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan10 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch