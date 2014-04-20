generated
scan13
	self recordMatch: #(38).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch