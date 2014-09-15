generated
scan23
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self recordAndReportMatch: #(150) ].
	^ self reportLastMatch