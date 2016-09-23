generated
scan3
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch