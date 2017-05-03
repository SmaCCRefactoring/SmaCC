generated
scan1X2
	self recordMatch: #(158 159).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan18 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan20 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan21 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(158).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self scan20 ].
					('Uu' includes: currentCharacter)
						ifTrue: [ ^ self scan21 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(159) ].
	^ self reportLastMatch