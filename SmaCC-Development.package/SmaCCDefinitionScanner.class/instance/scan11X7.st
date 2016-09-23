generated
scan11X7
	self recordMatch: #(37).
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch