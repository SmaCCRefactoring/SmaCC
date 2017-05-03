generated
scanForTokenX2
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(21).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter isDigit ] whileTrue.
			('Dd' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan4 ] ].
	^ self reportLastMatch