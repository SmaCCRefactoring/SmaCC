generated
scan24
	self recordMatch: #(53).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	^ self reportLastMatch