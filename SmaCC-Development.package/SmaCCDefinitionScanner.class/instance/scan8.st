generated
scan8
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_
				or: [ (currentCharacter between: $a and: $z)
						or: [ ('ªµº' includes: currentCharacter)
								or: [ (currentCharacter
										between: (Character value: 192)
										and: (Character value: 214))
										or: [ (currentCharacter
												between: (Character value: 216)
												and: (Character value: 246))
												or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
		ifTrue: [ [ self step.
			currentCharacter == $>
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $z)
										or: [ ('ªµº' includes: currentCharacter)
												or: [ (currentCharacter
														between: (Character value: 192)
														and: (Character value: 214))
														or: [ (currentCharacter
																between: (Character value: 216)
																and: (Character value: 246))
																or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch