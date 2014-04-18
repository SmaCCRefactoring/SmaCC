generated
scan27
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan28 ].
	^ self reportLastMatch