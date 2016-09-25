generated
scan9
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	^ self reportLastMatch