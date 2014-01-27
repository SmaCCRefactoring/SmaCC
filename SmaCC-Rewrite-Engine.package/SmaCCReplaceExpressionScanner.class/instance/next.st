accessing
next
	state = #code
		ifTrue:
			[self resetScanner.
			returnMatchBlock := [:match | ^match].
			^self scanCode].
	^super next