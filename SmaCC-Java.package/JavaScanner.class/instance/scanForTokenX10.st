generated
scanForTokenX10
	self recordMatch: #(54).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	^ self reportLastMatch