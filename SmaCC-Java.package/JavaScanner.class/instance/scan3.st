generated
scan3
	[self step.
	currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(100)].
	currentCharacter == $\
		ifTrue:
			[self step.
			currentCharacter == $u
				ifTrue:
					[self step.
					(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
						ifTrue:
							[3
								timesRepeat:
									[self step.
									(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
							^self scan3].
					^self reportLastMatch].
			(('"''' includes: currentCharacter)
				or: [(currentCharacter between: $0 and: $7) or: ['\bfnrt' includes: currentCharacter]]) ifTrue: [^self scan3].
			^self reportLastMatch]] repeat