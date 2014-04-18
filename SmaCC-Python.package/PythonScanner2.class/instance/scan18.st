generated
scan18
	self recordMatch: #(40).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch