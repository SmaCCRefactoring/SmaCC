generated
scan7
	[ self recordMatch: #(59).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch