generated
scanForTokenX12
	self recordMatch: #(30).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(116) ].
	^ self reportLastMatch