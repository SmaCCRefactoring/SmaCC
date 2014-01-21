generated
scan9
	self step.
	(currentCharacter isLetter or: [currentCharacter == $_]) ifTrue: [^self scan10].
	^self reportLastMatch