generated
scanForTokenX7
	self recordMatch: #(18).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	^ self reportLastMatch