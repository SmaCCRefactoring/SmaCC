generated
scanForTokenX12
	self recordMatch: #(4).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(61) ].
	^ self reportLastMatch