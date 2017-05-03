generated
scan4
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch