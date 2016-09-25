generated
scanForTokenX5
	self recordMatch: #(66).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(70) ].
	^ self reportLastMatch