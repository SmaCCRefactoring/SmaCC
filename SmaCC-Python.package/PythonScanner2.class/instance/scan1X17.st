generated
scan1X17
	self recordMatch: #(38).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch