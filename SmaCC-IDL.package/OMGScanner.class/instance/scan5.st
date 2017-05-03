generated
scan5
	[ self recordMatch: #(59).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch