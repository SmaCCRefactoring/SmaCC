generated
scan31
	self recordMatch: #(20).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(71) ].
	^ self reportLastMatch