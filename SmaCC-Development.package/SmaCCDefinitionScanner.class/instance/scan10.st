generated
scan10
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	^ self reportLastMatch