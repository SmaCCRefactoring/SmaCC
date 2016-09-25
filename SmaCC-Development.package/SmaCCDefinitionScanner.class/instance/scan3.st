generated
scan3
	self recordMatch: #(36).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch