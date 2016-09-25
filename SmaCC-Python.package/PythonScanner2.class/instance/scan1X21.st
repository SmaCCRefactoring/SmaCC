generated
scan1X21
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch