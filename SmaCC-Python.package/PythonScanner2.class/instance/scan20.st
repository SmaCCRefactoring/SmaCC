generated
scan20
	self recordMatch: #(41).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	^ self reportLastMatch