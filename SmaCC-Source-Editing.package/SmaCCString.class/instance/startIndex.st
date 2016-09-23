accessing
startIndex
	^ firstSentinel next isSentinel
		ifTrue: [ 0 ]
		ifFalse: [ firstSentinel next startIndex ]