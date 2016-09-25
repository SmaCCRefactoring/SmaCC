merging
mergeWith: aSmaCCAction prefer: aClass
	aSmaCCAction isReduce
		ifTrue: [ ^ self mergeWithReduceAction: aSmaCCAction ].
	^ aSmaCCAction mergeWith: self prefer: aClass