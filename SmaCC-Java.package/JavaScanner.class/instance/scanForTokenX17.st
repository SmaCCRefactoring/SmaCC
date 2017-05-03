generated
scanForTokenX17
	self recordMatch: #(86).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	^ self reportLastMatch