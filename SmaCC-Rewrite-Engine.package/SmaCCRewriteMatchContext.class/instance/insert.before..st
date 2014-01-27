private
insert: aString before: anObject
	| position anIndex |
	anIndex := self startIndexFor: anObject.
	anIndex isNil ifTrue: [^nil].
	position := self source insert: aString at: anIndex.
	rewriteEngine
		updateStartPositionFor: ((anObject isKindOf: SmaCCParseNode) ifTrue: [anObject] ifFalse: [match])
		to: position
		whenEqualTo: anIndex.
	^position