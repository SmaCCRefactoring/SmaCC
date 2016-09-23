generated
scanForTokenX15
	self recordMatch: #(74).
	self step.
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch