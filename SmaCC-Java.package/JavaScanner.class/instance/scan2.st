generated
scan2
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(101) ].
	^ self reportLastMatch