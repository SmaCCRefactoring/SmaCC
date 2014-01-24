copying
copy
	| new first last current newCurrent |
	first := last := nil.
	new := self class new.
	current := firstSentinel next.
	[current isSentinel]
		whileFalse:
			[newCurrent := current copy.
			first isNil ifTrue: [first := newCurrent].
			last notNil ifTrue: [last next: newCurrent].
			last := newCurrent.
			current := current next].
	first notNil ifTrue: [new insertFirst: first last: last at: 1].
	new setIntervalId.
	^new