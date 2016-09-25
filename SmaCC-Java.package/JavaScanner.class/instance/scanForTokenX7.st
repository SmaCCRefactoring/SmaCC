generated
scanForTokenX7
	self recordMatch: #(49).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	^ self reportLastMatch