accessing
characterAtEndOf: aSmaCCNode
	| index |
	index := self stopIndexFor: aSmaCCNode.
	^self characterAt: ((self source isRemoved: index) ifTrue: [self source previousIndex: index] ifFalse: [index])