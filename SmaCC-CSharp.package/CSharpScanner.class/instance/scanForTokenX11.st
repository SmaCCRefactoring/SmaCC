generated
scanForTokenX11
	self recordMatch: #(16).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(131) ].
	^ self reportLastMatch