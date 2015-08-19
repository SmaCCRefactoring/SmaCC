generated
scan14
	self step.
	currentCharacter = $t
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch