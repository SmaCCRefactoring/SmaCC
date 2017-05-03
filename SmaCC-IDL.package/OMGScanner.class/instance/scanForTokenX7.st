generated
scanForTokenX7
	self recordMatch: #(44).
	self step.
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch