generated
scan12X10
	self recordMatch: #(36 41).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch