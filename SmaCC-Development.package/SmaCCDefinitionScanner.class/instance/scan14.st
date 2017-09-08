generated
scan14
	[ self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch