generated
scanForTokenX9
	self recordMatch: #(32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(115) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	^ self reportLastMatch