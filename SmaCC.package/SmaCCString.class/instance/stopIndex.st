accessing
stopIndex
	^lastSentinel previous isSentinel ifTrue: [0] ifFalse: [lastSentinel previous stopIndex]