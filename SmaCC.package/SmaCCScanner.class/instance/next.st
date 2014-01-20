accessing
next
	self resetScanner.
	returnMatchBlock := [:match | ^match].
	^self scanForToken