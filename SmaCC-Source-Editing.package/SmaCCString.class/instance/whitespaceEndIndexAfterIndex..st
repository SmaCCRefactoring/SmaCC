accessing
whitespaceEndIndexAfterIndex: stopPosition
	| currentIndex position startIndex |
	position := stopPosition.
	position isNil ifTrue: [^nil].
	startIndex := self nextIndex: position.
	startIndex isNil ifTrue: [^nil].
	currentIndex := startIndex.
	[currentIndex notNil and: [(self at: currentIndex) isWhitespace]]
		whileTrue: [currentIndex := self nextIndex: currentIndex].
	^currentIndex isNil ifTrue: [self stopIndex] ifFalse: [self basicPreviousIndex: currentIndex]