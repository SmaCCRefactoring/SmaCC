generated
scan5
	self step.
	currentCharacter == $* ifTrue: [^self scan6].
	^self reportLastMatch