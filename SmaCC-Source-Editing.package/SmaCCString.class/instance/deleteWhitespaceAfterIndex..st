accessing
deleteWhitespaceAfterIndex: stopPosition
	| stopIndex |
	stopIndex := self whitespaceEndIndexAfterIndex: stopPosition.
	(stopIndex isNil
		or: [ self isIndex: stopIndex equalTo: stopPosition ])
		ifTrue: [ ^ '' ].
	^ self deleteFrom: (self nextIndex: stopPosition) to: stopIndex