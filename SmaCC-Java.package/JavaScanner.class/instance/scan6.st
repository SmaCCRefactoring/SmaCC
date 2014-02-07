generated
scan6
	[self recordMatch: #(97).
	self step.
	currentCharacter isDigit] whileTrue.
	('DFdf' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(97)].
	^self reportLastMatch