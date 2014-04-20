generated
scan26
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan27 ].
	^ self reportLastMatch