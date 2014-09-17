generated
scan14
	[ 
	self recordMatch: #(168).
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch