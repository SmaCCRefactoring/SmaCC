generated
scan9
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch