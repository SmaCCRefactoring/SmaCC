generated
scan12
	[ self step.
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	currentCharacter between: $0 and: $9 ] whileTrue.
	^ self reportLastMatch