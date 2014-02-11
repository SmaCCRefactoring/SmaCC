generated
scan10
	self step.
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch