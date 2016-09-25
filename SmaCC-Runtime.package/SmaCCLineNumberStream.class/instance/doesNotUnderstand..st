error handling
doesNotUnderstand: aMessage
	^ [ sourceStream
		perform: aMessage selector
		withArguments: aMessage arguments ]
		ensure: [ self position: sourceStream position ]