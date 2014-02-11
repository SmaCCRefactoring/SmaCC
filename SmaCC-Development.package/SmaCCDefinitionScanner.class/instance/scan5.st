generated
scan5
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue.
	^ self reportLastMatch