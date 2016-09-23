generated
scanForTokenX15
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan8 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX13 ].
	((currentCharacter between: $A and: $Z)
		or: [ (currentCharacter between: $a and: $t)
				or: [ currentCharacter between: $v and: $z ] ])
		ifTrue:
			[ ^ self scanForTokenX12 ].
	(currentCharacter isSafeForHTTP
		or: [ currentCharacter == $%
				or: [ (currentCharacter between: $* and: $+)
						or:
							[ '^|~' includes: currentCharacter ] ] ])
		ifTrue:
			[ self scanForTokenX9 ].
	^ self reportLastMatch