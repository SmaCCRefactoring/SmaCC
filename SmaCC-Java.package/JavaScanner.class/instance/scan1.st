generated
scan1
	self step.
	currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(99)].
	^self reportLastMatch