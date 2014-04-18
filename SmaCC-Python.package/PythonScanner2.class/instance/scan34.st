generated
scan34
	self recordMatch: #(22).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(61) ].
	^ self reportLastMatch