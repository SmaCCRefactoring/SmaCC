generated
scan21
	self recordMatch: #(158).
	self step.
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(158) ].
	^ self reportLastMatch