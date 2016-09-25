generated
scanForTokenX5
	self recordMatch: #(90).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(71) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(87) ].
	^ self reportLastMatch