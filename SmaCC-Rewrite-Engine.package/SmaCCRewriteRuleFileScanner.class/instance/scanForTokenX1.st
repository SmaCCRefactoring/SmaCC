generated
scanForTokenX1
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch