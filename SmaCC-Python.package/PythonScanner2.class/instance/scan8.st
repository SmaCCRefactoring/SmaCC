generated
scan8
	self recordMatch: #(48).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	^ self reportLastMatch