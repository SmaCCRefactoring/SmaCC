generated
scan5
	self step.
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch