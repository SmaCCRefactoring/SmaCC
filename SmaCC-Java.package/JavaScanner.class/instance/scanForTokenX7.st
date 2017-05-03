generated
scanForTokenX7
	self recordMatch: #(50).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	^ self reportLastMatch