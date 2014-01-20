accessing
whitespaceBeforeIndex: startPosition
	| startIndex |
	startIndex := self whitespaceStartIndexBeforeIndex: startPosition.
	startIndex isNil ifTrue: [^''].
	^(self copyFrom: startIndex to: (self basicPreviousIndex: startPosition)) asString