generated
scan5
	[ self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('FLfl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch