generated
scan2
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	^ self reportLastMatch