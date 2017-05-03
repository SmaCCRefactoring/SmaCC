generated
scan19
	[ self recordMatch: #(158 159).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan18 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan20 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan21 ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch