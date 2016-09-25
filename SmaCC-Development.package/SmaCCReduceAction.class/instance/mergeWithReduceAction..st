merging
mergeWithReduceAction: aSmaCCAction
	self = aSmaCCAction
		ifTrue: [ ^ self ].
	^ SmaCCAmbiguousAction new
		addAction: self;
		addAction: aSmaCCAction;
		yourself