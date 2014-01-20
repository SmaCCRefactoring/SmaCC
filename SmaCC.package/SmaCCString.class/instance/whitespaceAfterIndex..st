accessing
whitespaceAfterIndex: stopPosition
	| stopIndex |
	stopIndex := self whitespaceEndIndexAfterIndex: stopPosition.
	stopIndex isNil ifTrue: [^''].
	^(self copyFrom: (self basicNextIndex: stopPosition) to: stopIndex) asString