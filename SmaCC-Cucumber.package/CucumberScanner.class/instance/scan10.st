generated
scan10
	self step.
	currentCharacter = $d
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch