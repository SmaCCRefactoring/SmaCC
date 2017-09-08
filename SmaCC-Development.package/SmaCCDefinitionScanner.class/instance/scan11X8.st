generated
scan11X8
	self recordMatch: #(40).
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch