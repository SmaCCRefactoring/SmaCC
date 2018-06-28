generated
scan9X11
	currentCharacter == ${
		ifTrue: [ ^ self scan9X6 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 41) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan9X8 ].
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
		ifTrue: [ ^ self scan9X1 ].
	^ self recordAndReportMatch: #(41)