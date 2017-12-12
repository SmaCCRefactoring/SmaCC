generated
scanForTokenX8
	self recordMatch: #(2).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch