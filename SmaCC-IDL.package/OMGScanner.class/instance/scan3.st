generated
scan3
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	^ self reportLastMatch