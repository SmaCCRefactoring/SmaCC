generated
scan10
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch