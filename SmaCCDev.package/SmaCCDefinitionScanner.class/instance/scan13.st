generated
scan13
	[self step.
	currentCharacter == $\ ifTrue: [^self scan14].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(35)]] repeat