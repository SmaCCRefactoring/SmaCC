generated
scan25
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self recordAndReportMatch: #(144) ].
	^ self reportLastMatch