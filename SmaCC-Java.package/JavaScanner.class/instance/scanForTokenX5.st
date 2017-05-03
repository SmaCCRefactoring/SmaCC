generated
scanForTokenX5
	self recordMatch: #(90).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(70) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(88) ].
	^ self reportLastMatch