generated
scanForTokenX9
	self recordMatch: #(91).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(93) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(68) ].
	^ self reportLastMatch