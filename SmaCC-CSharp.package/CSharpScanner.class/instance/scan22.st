generated
scan22
	self recordMatch: #(58).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	^ self reportLastMatch