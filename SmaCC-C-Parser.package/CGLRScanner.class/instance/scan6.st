generated
scan6
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch