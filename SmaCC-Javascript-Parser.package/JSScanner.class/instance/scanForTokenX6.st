generated
scanForTokenX6
	self recordMatch: #(6).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	^ self reportLastMatch