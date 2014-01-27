generated
scan2
	[self step.
	currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(158)].
	currentCharacter == $\
		ifTrue:
			[self step.
			currentCharacter == $x ifTrue: [^self scan3].
			('Uu' includes: currentCharacter)
				ifTrue:
					[self step.
					(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
						ifTrue:
							[2
								timesRepeat:
									[self step.
									(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
							^self scan3].
					^self reportLastMatch].
			(('"''0\' includes: currentCharacter)
				or: [(currentCharacter between: $a and: $b) or: ['fnrtv' includes: currentCharacter]]) ifTrue: [^self scan2].
			^self reportLastMatch].
	currentCharacter <= ##(Character value: 9)
		or:
			[(currentCharacter between: ##(Character value: 11) and: $!)
				or: [(currentCharacter between: $# and: $[) or: [currentCharacter >= $]]]]] whileTrue.
	^self reportLastMatch