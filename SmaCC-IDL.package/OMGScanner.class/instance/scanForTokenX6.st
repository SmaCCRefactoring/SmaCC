generated
scanForTokenX6
	self recordMatch: #(42).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	^ self reportLastMatch