generated
scan20
	self recordMatch: #(158).
	self step.
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(158) ].
	^ self reportLastMatch