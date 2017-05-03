generated
scanForTokenX14
	self recordMatch: #(15).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(93) ].
	^ self reportLastMatch