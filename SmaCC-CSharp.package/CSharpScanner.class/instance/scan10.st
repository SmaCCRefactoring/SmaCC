generated
scan10
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(160) ].
	^ self reportLastMatch