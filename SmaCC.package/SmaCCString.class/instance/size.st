accessing
size
	| current length |
	length := 0.
	current := firstSentinel next.
	[current isSentinel]
		whileFalse:
			[length := length + current size.
			current := current next].
	^length