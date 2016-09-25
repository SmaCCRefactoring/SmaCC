generated
scanForTokenX12
	self recordMatch: #(51).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	^ self reportLastMatch