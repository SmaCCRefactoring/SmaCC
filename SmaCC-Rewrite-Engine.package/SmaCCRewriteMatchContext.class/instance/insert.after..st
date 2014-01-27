private
insert: aString after: anObject
	| position endPosition anIndex |
	anIndex := self stopIndexFor: anObject.
	anIndex isNil ifTrue: [^nil].
	position := self source insert: aString asString at: (self source nextIndex: anIndex).
	position isNil ifTrue: [^nil].
	endPosition := position + (aString size - 1).
	self
		updateStopPositionFor: ((anObject isKindOf: SmaCCParseNode) ifTrue: [anObject] ifFalse: [match])
		to: endPosition
		whenEqualTo: anIndex.
	^position