generated
scan58
	self recordMatch: #(46).
	self step.
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch