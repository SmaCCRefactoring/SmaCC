generated
scan10
	[self step.
	currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(25)].
	currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue.
	^self reportLastMatch