generated
scan6
	[ self recordMatch: #(100).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch