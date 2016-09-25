accessing
whitespaceEndIndexAfterIndex: stopPosition
	| currentIndex position startIndex stopIndex |
	position := stopPosition.
	position isNil
		ifTrue: [ ^ nil ].
	startIndex := self nextIndex: position.
	startIndex isNil
		ifTrue: [ ^ nil ].
	currentIndex := startIndex.
	stopIndex := self stopIndex + 1.
	[ currentIndex notNil
		and:
			[ currentIndex ~= stopIndex
				and: [ (self at: currentIndex) isSeparator ] ] ]
		whileTrue: [ currentIndex := self nextIndex: currentIndex ].
	(currentIndex isNil or: [ currentIndex = stopIndex ])
		ifTrue: [ ^ self stopIndex ].
	[ currentIndex := self basicPreviousIndex: currentIndex.
	(self isIndex: stopPosition equalTo: currentIndex)
		or: [ (self isRemoved: currentIndex) not ] ] whileFalse.
	^ currentIndex