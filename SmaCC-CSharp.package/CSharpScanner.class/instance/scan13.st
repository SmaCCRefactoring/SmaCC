generated
scan13
	self recordMatch: #(155).
	self step.
	('Ll' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(155)].
	^self reportLastMatch