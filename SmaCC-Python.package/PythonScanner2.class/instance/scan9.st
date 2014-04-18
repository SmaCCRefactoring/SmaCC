generated
scan9
	self recordMatch: #(42).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch