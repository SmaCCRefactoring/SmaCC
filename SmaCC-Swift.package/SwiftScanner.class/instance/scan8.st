generated
scan8
	[ self recordMatch: #(87 88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan6 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan7 ].
	currentCharacter isDigit or: [ currentCharacter == $_ ] ] whileTrue.
	^ self reportLastMatch