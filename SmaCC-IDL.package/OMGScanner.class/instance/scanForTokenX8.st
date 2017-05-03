generated
scanForTokenX8
	self recordMatch: #(19).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	^ self reportLastMatch