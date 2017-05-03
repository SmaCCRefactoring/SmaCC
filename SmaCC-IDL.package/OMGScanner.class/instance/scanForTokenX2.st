generated
scanForTokenX2
	[ self recordMatch: #(58).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch