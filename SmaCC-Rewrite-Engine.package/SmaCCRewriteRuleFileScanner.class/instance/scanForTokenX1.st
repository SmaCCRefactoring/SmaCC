generated
scanForTokenX1
	self recordMatch: #(8).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch