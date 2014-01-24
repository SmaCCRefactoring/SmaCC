accessing
startOfLineWhitespaceStartIndexBeforeIndex: startPosition
	| stopIndex currentIndex position |
	position := startPosition.
	position isNil ifTrue: [^nil].
	stopIndex := self previousIndex: position.
	stopIndex isNil ifTrue: [^nil].
	currentIndex := stopIndex.
	[currentIndex notNil
		and:
			[| char |
			char := self at: currentIndex.
			char isWhitespace and: [char ~= Character cr and: [char ~= Character lf]]]]
		whileTrue: [currentIndex := self previousIndex: currentIndex].
	^currentIndex isNil ifTrue: [self startIndex] ifFalse: [self basicNextIndex: currentIndex]