generated
scan13
	[ 
	self recordMatch: #(79).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan11 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch