generated
scan39
	self recordMatch: #(47).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	^ self reportLastMatch