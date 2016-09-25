generated
scanForTokenX16
	self recordMatch: #(34).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	^ self reportLastMatch