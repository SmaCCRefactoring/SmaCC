generated
scan9
	[ self recordMatch: #(88).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch