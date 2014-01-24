generated
scan4
	self recordMatch: #(27).
	self step.
	currentCharacter == $" ifTrue: [^self scan3].
	^self reportLastMatch