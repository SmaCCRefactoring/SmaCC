generated
scan11X7
	self recordMatch: #(40).
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch