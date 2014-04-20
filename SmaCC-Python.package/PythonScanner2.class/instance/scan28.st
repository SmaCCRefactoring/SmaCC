generated
scan28
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan29 ].
	^ self reportLastMatch