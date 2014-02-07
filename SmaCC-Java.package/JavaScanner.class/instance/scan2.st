generated
scan2
	self step.
	currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(99)].
	(currentCharacter between: $0 and: $7) ifTrue: [^self scan1].
	^self reportLastMatch