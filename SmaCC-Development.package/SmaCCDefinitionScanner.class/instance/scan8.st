generated
scan8
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch