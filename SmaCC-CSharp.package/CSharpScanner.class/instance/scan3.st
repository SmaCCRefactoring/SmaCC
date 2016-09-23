generated
scan3
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(157) ].
	^ self reportLastMatch