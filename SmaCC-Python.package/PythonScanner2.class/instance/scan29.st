generated
scan29
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan27 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan28 ].
	^ self reportLastMatch