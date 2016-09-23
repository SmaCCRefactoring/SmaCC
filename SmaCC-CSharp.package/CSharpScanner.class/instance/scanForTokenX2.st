generated
scanForTokenX2
	self recordMatch: #(155 156).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan8 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(155).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self scan10 ].
					('Uu' includes: currentCharacter)
						ifTrue: [ ^ self scan11 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(156) ].
	^ self reportLastMatch