editing
addNewLineWhitespace: aString from: startIndex to: stopIndex
	| currentInterval next |
	currentInterval := self intervalContaining: startIndex.
	[ currentInterval isSentinel
		ifTrue: [ ^ self ].
	next := currentInterval next.
	currentInterval isRemoved
		ifFalse:
			[ self
				addNewLineWhitespace: aString
				toInterval: currentInterval
				from: startIndex
				to: stopIndex ].
	currentInterval containsIndex: stopIndex ]
		whileFalse: [ currentInterval := next ]