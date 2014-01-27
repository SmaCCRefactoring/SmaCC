generated
scan12
	self recordMatch: #(155).
	self step.
	('Uu' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(155)].
	^self reportLastMatch