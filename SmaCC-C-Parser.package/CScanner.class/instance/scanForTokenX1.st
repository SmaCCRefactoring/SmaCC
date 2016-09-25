generated
scanForTokenX1
	self recordMatch: #(77).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(77).
					self step.
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
					('LUlu' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(77) ] ].
			^ self reportLastMatch ].
	('LUlu' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch