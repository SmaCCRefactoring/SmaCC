generated
scan9
	self recordMatch: #(32).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(117) ].
	^ self reportLastMatch