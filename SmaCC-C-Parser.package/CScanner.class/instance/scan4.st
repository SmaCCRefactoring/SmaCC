generated
scan4
	[self step.
	currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(78)].
	currentCharacter == $\
		ifTrue:
			[self step.
			^self scan4]] repeat