generated
scan7
	[ self recordMatch: #(77).
	self step.
	currentCharacter isDigit ] whileTrue.
	('FLfl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch