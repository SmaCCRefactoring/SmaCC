generated
scan11
	self step.
	currentCharacter = $%
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch