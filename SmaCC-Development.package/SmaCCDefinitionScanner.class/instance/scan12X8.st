generated
scan12X8
	self recordMatch: #(41).
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch