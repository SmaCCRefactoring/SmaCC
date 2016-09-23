generated
scanForTokenX16
	self recordMatch: #(85).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	^ self reportLastMatch