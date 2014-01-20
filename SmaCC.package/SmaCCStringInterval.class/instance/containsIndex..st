private
containsIndex: anIndex
	| indexPosition indexId |
	self isSentinel ifTrue: [^true].
	anIndex isInteger
		ifTrue:
			[indexPosition := anIndex.
			indexId := 1]
		ifFalse:
			[indexPosition := anIndex index.
			indexId := anIndex intervalId].
	^id = indexId and: [(indexPosition between: start and: stop) or: [indexPosition = 0]]