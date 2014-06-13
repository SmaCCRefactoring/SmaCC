generated
scan4
	self step.
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch