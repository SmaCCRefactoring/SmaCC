generated
scan10
	[ self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue.
	^ self reportLastMatch