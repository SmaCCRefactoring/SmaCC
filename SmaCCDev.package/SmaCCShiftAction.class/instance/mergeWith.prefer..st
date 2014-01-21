merging
mergeWith: aSmaCCAction prefer: aClass
	aSmaCCAction isShift ifTrue: [^self].
	aSmaCCAction isReduce ifTrue: [^self mergeWithReduceAction: aSmaCCAction prefer: aClass].
	^aSmaCCAction mergeWith: self prefer: aClass