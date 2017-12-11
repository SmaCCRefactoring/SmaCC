generated
scanForTokenX11
	self recordMatch: #(28).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(63) ].
	^ self reportLastMatch