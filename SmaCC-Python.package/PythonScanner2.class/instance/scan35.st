generated
scan35
	self recordMatch: #(22).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	^ self reportLastMatch