generated
scan11
	[ 
	self recordMatch: #(79).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch