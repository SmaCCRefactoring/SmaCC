accessing
stopPosition
	start isNil ifTrue: [^nil].
	^start + value size - 1