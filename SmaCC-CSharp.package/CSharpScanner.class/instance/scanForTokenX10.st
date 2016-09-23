generated
scanForTokenX10
	self recordMatch: #(43).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch