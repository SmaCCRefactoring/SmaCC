generated
scan2
	[self step.
	currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(30)].
	currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue.
	^self reportLastMatch