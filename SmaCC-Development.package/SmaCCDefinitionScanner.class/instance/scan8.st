generated
scan8
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	^ self reportLastMatch