accessing
startIndex
	self isSentinel ifTrue: [^nil].
	^self isEmpty ifTrue: [next startIndex] ifFalse: [SmaCCStringIndex index: start intervalId: id]