generated
scan4
	self recordMatch: #(24).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch