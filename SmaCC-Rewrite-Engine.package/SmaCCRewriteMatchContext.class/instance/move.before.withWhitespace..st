private
move: anObject before: anotherObject withWhitespace: aString
	| start stop oldStart |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	oldStart := self startIndexFor: anotherObject.
	self source
		moveFrom: start
		to: stop
		before: oldStart.
	aString notEmpty
		ifTrue:
			[self source
				addNewLineWhitespace: aString
				from: start
				to: stop].
	rewriteEngine
		updateStartPositionFor: ((anotherObject isKindOf: SmaCCParseNode) ifTrue: [anotherObject] ifFalse: [match])
		to: start
		whenEqualTo: oldStart.
	^self startIndexFor: anObject