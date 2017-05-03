generated
scanForTokenX9
	self recordMatch: #(59).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch