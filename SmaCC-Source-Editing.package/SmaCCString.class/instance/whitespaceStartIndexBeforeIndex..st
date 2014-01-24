accessing
whitespaceStartIndexBeforeIndex: startPosition
	| stopIndex currentIndex position |
	position := startPosition.
	position isNil ifTrue: [^nil].
	stopIndex := self previousIndex: position.
	stopIndex isNil ifTrue: [^nil].
	currentIndex := stopIndex.
	[currentIndex notNil and: [(self at: currentIndex) isWhitespace]]
		whileTrue: [currentIndex := self previousIndex: currentIndex].
	^currentIndex isNil ifTrue: [self startIndex] ifFalse: [self basicNextIndex: currentIndex]