generated
scanForToken
	state == #expression
		ifTrue:
			[self step.
			currentCharacter == $\ ifTrue: [^self recordAndReportMatch: #(2)].
			currentCharacter == $_ ifTrue: [^self recordAndReportMatch: #(4)].
			currentCharacter == $` ifTrue: [^self recordAndReportMatch: #(6)].
			((currentCharacter between: $! and: $/)
				or:
					[(currentCharacter between: $: and: $@)
						or:
							[currentCharacter == $[ or: [(currentCharacter between: $] and: $^) or: [currentCharacter between: ${ and: $~]]]])
				ifTrue:
					[[self recordMatch: #(3).
					self step.
					(currentCharacter between: $! and: $/)
						or:
							[(currentCharacter between: $: and: $@)
								or:
									[currentCharacter == $[ or: [(currentCharacter between: $] and: $^) or: [currentCharacter between: ${ and: $~]]]]]
						whileTrue.
					^self reportLastMatch].
			currentCharacter isLetter
				ifTrue:
					[[self recordMatch: #(1).
					self step.
					currentCharacter isLetter or: [currentCharacter isHexDigit]] whileTrue].
			^self reportLastMatch].
	state == #default
		ifTrue:
			[self step.
			currentCharacter == $`
				ifTrue:
					[self recordMatch: #(6).
					self step.
					currentCharacter == $` ifTrue: [^self recordAndReportMatch: #(7)].
					^self reportLastMatch].
			true
				ifTrue:
					[[self recordMatch: #(5).
					self step.
					currentCharacter ~~ $`] whileTrue].
			^self reportLastMatch].
	state == #code
		ifTrue:
			[2
				timesRepeat:
					[self step.
					currentCharacter == $` ifFalse: [^self reportLastMatch]].
			^self recordAndReportMatch: #(7)].
	^self reportLastMatch