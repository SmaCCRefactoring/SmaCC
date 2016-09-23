merging
mergeWith: aSmaCCAction prefer: aClass
	aSmaCCAction isReduce
		ifTrue:
			[ self reduceAction = aSmaCCAction
				ifTrue: [ ^ self ].
			^ SmaCCAmbiguousAction new
				addAction: aSmaCCAction;
				addActions: actions;
				yourself ].
	aSmaCCAction isShift
		ifTrue: [ self addAction: aSmaCCAction.
			^ self ].
	^ aSmaCCAction mergeWith: self prefer: aClass