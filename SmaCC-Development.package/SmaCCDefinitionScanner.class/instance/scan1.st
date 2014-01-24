generated
scan1
	self step.
	(currentCharacter isLetter or: [currentCharacter == $_]) ifTrue: [^self scan2].
	^self reportLastMatch