generated
scanForTokenX16
	self recordMatch: #(16).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	^ self reportLastMatch