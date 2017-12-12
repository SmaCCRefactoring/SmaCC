generated
scanForTokenX5
	self recordMatch: #(27).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(74) ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch