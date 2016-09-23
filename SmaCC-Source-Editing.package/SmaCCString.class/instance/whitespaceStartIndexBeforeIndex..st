accessing
whitespaceStartIndexBeforeIndex: startPosition
	| stopIndex currentIndex position |
	position := startPosition.
	position isNil
		ifTrue: [ ^ nil ].
	stopIndex := self previousIndex: position.
	stopIndex isNil
		ifTrue: [ ^ nil ].
	currentIndex := stopIndex.
	[ currentIndex notNil and: [ (self at: currentIndex) isSeparator ] ]
		whileTrue: [ currentIndex := self previousIndex: currentIndex ].
	currentIndex isNil
		ifTrue: [ ^ self startIndex ].
	[ currentIndex := self basicNextIndex: currentIndex.
	(self isIndex: startPosition equalTo: currentIndex)
		or: [ (self isRemoved: currentIndex) not ] ] whileFalse.
	^ currentIndex