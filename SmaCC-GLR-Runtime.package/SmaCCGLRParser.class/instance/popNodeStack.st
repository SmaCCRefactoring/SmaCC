private
popNodeStack
	| result |
	result := nodeStack removeLast.
	(self alwaysPerformReduceAction and: [states size > 1]) ifTrue: [result := self copyStackObject: result].
	^result