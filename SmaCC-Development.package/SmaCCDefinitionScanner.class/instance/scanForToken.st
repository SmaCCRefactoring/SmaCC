generated
scanForToken
	state == #scanner
		ifTrue:
			[^ self scan17].
	state == #parser
		ifTrue:
			[^ self scan18].
	state == #directives
		ifTrue:
			[self step.
			currentCharacter == $' ifTrue: [^self scan1].
			currentCharacter == $" ifTrue: [^self scan3].
			currentCharacter == $#
				ifTrue:
					[[self recordMatch: #(28).
					self step.
					currentCharacter <= (Character value: 9)
						or:
							[(currentCharacter between: (Character value: 11) and: (Character value: 12))
								or: [currentCharacter >= (Character value: 14)]]] whileTrue.
					^self reportLastMatch].
			currentCharacter == $% ifTrue: [^self recordAndReportMatch: #(32)].
			currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(2)].
			currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(6)].
			currentCharacter == $* ifTrue: [^self recordAndReportMatch: #(3)].
			currentCharacter == $/ ifTrue: [^self scan5].
			currentCharacter == $: ifTrue: [^self scan7].
			currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(33)].
			currentCharacter == $? ifTrue: [^self recordAndReportMatch: #(5)].
			currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(29)].
			currentCharacter == $| ifTrue: [^self recordAndReportMatch: #(1)].
			currentCharacter == $+ ifTrue: [^self recordAndReportMatch: #(4)].
			currentCharacter == $< ifTrue: [^self scan9].
			currentCharacter == $a
				ifTrue:
					[^ self scan19].
			currentCharacter == $e
				ifTrue:
					[^ self scan20].
			currentCharacter == $g
				ifTrue:
					[^ self scan22].
			currentCharacter == $h
				ifTrue:
					[^ self scan23].
			currentCharacter == $i
				ifTrue:
					[^ self scan21].
			currentCharacter == $l
				ifTrue:
					[^ self scan24].
			currentCharacter == $n
				ifTrue:
					[^ self scan25].
			currentCharacter == $p
				ifTrue:
					[^ self scan26].
			currentCharacter == $r
				ifTrue:
					[^ self scan27].
			currentCharacter == $s
				ifTrue:
					[^ self scan28].
			currentCharacter isWhitespace
				ifTrue:
					[[self recordMatch: #(24).
					self step.
					currentCharacter isWhitespace] whileTrue.
					^self reportLastMatch].
			(currentCharacter isLetter or: [currentCharacter == $_])
				ifTrue:
					[[self recordMatch: #(26).
					self step.
					currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue].
			^self reportLastMatch].
	state == #default
		ifTrue:
			[^ self scan16].
	^self reportLastMatch