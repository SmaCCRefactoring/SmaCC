generated
scan10
	self step.
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch