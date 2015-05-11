generated
scan13
	self step.
	currentCharacter = $t
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch