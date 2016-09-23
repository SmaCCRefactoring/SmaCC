editing
deleteFrom: startIndex to: stopIndex
	| startInterval atEnd |
	startInterval := self intervalContaining: startIndex.
	startInterval := startInterval splitAt: (self indexFor: startIndex).
	[ atEnd := startInterval containsIndex: stopIndex.
	(atEnd and: [ startInterval stop ~= (self indexFor: stopIndex) ])
		ifTrue: [ startInterval splitAt: (self indexFor: stopIndex) + 1 ].
	cachedInterval := startInterval := self removeInterval: startInterval.
	atEnd or: [ startInterval containsIndex: stopIndex ] ]
		whileFalse: [ startInterval := startInterval next ]