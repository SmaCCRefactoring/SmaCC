accessing
deleteWhitespaceBeforeIndex: startPosition
	| startIndex |
	startIndex := self whitespaceStartIndexBeforeIndex: startPosition.
	(startIndex isNil
		or: [ self isIndex: startIndex equalTo: startPosition ])
		ifTrue: [ ^ '' ].
	^ self
		deleteFrom: startIndex
		to: (self basicPreviousIndex: startPosition)