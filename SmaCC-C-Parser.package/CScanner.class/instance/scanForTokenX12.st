generated
scanForTokenX12
	self recordMatch: #(30).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	^ self reportLastMatch