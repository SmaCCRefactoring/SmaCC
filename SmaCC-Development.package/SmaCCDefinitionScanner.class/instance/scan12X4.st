generated
scan12X4
	self recordMatch: #(41).
	self step.
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch