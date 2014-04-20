generated
scan22
	self recordMatch: #(44).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch