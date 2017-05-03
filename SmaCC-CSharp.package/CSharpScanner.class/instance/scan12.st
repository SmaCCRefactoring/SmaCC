generated
scan12
	self recordMatch: #(19).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(34) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(132) ].
	^ self reportLastMatch