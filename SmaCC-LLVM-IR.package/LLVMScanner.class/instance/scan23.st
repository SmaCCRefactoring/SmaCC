generated
scan23
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self recordAndReportMatch: #(151) ].
	^ self reportLastMatch