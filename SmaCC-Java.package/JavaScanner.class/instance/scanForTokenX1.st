generated
scanForTokenX1
	self step.
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == $u
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self scan2 ] ] ] ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $3)
				ifTrue: [ self step.
					currentCharacter == $'
						ifTrue: [ ^ self recordAndReportMatch: #(102) ].
					(currentCharacter between: $0 and: $7)
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			(currentCharacter between: $4 and: $7)
				ifTrue: [ ^ self scan3 ].
			('"''\bfnrt' includes: currentCharacter)
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	(currentCharacter <= $&
		or: [ (currentCharacter between: $( and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch