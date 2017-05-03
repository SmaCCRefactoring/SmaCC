generated
scan13
	[ self recordMatch: #(137).
	self step.
	currentCharacter == $.
		ifTrue: [ self recordMatch: #(137).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(138) ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan11 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch