generated
scan5
	[ 
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue.
	^ self reportLastMatch