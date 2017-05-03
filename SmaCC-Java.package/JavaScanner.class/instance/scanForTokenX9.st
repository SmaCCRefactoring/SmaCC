generated
scanForTokenX9
	self recordMatch: #(91).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(95) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	^ self reportLastMatch