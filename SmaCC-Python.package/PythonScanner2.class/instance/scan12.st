generated
scan12
	self recordMatch: #(51).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch