generated
scan21
	self recordMatch: #(44).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch