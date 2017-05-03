generated
scanForTokenX4
	(self scanForString: '<<')
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self reportLastMatch