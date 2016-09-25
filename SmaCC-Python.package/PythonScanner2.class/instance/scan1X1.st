generated
scan1X1
	self recordMatch: #(73).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan13 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan1X1X1 ].
	('Bb' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Xx' includes: currentCharacter)
		ifTrue:
			[ ^ self scan1X1X2 ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch