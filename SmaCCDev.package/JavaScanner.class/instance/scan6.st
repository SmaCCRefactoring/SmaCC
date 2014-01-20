generated-scanner
scan6
	self step.
	currentCharacter = $'
		ifTrue: [ ^ self recordAndReportMatch: #(96) ].
	^ self reportLastMatch