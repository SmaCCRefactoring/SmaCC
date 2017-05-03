generated
scanForTokenX3
	(self scanForString: '>>')
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	^ self reportLastMatch