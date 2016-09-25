generated
scanForTokenX8
	self recordMatch: #(39).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(67) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	^ self reportLastMatch