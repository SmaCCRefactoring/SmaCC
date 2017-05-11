generated
scan14
	[ self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch