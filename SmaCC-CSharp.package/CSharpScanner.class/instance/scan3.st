generated
scan3
	self step.
	(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifTrue: [^self scan2].
	^self reportLastMatch