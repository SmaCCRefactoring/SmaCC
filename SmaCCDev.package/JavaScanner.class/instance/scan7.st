generated-scanner
scan7
	self step.
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(96) ].
	^ self reportLastMatch