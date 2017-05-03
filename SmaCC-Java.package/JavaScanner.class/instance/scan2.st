generated
scan2
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	^ self reportLastMatch