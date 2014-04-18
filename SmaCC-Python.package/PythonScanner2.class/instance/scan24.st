generated
scan24
	[ 
	self recordMatch: #(79).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan25 ].
	^ self reportLastMatch