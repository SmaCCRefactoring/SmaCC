generated
scanForTokenX5
	self recordMatch: #(18 32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch