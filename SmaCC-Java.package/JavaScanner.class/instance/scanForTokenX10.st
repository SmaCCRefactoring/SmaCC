generated
scanForTokenX10
	self recordMatch: #(52).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(61) ].
	^ self reportLastMatch