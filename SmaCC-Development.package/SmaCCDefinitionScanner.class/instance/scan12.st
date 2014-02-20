generated
scan12
	[ 
	self step.
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue.
	^ self reportLastMatch