generated
scan25
	self recordMatch: #(75).
	self step.
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch