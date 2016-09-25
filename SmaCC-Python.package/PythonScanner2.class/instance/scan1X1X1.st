generated
scan1X1X1
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan13 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch