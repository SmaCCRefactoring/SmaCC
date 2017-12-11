generated
scanForTokenX10
	self recordMatch: #(35).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	^ self reportLastMatch