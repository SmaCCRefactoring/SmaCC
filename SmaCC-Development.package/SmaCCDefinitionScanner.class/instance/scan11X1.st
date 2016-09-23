generated
scan11X1
	self step.
	currentCharacter == $c
		ifTrue: [ self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			^ self reportLastMatch ].
	currentCharacter == $x
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ self recordMatch: #(34).
					self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self recordMatch: #(34).
							self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self recordMatch: #(34).
									self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ ^ self recordAndReportMatch: #(34) ] ] ] ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(34)