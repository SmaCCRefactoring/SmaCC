generated
scan9
	self recordMatch: #(58).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(58).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan5 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan10 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan6 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(58) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(58) ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(58).
					self step.
					currentCharacter == $.
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ [ self step.
									('Pp' includes: currentCharacter)
										ifTrue: [ ^ self scan6 ].
									currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
							^ self reportLastMatch ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(58) ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	^ self reportLastMatch