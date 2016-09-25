generated
scan1X3
	[ self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch