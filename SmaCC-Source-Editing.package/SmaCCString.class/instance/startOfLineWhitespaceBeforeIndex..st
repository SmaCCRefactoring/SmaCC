accessing
startOfLineWhitespaceBeforeIndex: startPosition
	| startIndex |
	startIndex := self startOfLineWhitespaceStartIndexBeforeIndex: startPosition.
	startIndex isNil ifTrue: [^''].
	^(self copyFrom: startIndex to: (self basicPreviousIndex: startPosition)) asString