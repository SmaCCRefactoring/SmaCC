generated
scan7
	[ self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	('FLfl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch